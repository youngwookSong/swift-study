//
//  ViewController.swift
//  todolist_coredata
//
//  Created by 송영욱 on 2021/03/15.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tableview: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var models = [ToDoListItem]() //여기다가 데이터를 저장할거다
    //      var models : [ToDoListItem] = [] 랑 같은 코드
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CoreData To Do List"
        view.addSubview(tableview)
        
        getAllItems()
        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.frame = view.bounds
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    @objc private func didTapAdd() //추가시 나오는 alert
    {
        let alert = UIAlertController(title: "New Item", message: "Enter new item", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else{
            return
            }
        self?.createItem(name: text)
        }))
        
        
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row] //model안의 데이터를 불러옴
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.name //셀에 model의 index에 해당하는걸 표시
        return cell
    }
    
    //cell을 선택하면!
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = models[indexPath.row]
        //삭제시 나오는 alert
        let sheet = UIAlertController(title: "Edit", message: "\(item.date!)", preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { _ in
            
            //edit하면 edit하는 alert가 있어야한다.
            let alert = UIAlertController(title: "Edit Item", message: "Edit your item", preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            alert.textFields?.first?.text = item.name//textfield에 현재꺼 있음
            alert.addAction(UIAlertAction(title: "Save", style: .cancel, handler: { [weak self] _ in guard let field = alert.textFields?.first, let newName = field.text, !newName.isEmpty else{
                return
                }
            self?.updateItem(item: item, newName: newName)
            }))
            self.present(alert, animated: true)
        }))
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in self?.deleteItem(item: item)}))
        
        
        present(sheet, animated: true)
    }
    //core Data------------------------
    func getAllItems() //화면에 뿌려주는거
    {
        do
        {
            models = try context.fetch(ToDoListItem.fetchRequest())
            
            DispatchQueue.main.async { // data는 백그라운드이기때문에 main에서 놓으라는 명령이 필요
                self.tableview.reloadData()
            }
        }
        catch
        {
            //error
        }
        
    }
    
    func createItem(name: String)
    {
        let newitem = ToDoListItem(context: context)
        newitem.name = name
        newitem.date = Date()
        
        //save at coredata
        do{
            try context.save()
        }
        catch{
            
        }
        getAllItems()
    }
    
    func deleteItem(item: ToDoListItem)
    {
        //delete
        context.delete(item)
        
        //삭제한 후에도 저장을 해야됨5   
        do{
            try context.save()
        }
        catch{
            
        }
        getAllItems()
    }
    
    func updateItem(item: ToDoListItem, newName: String)
    {
        item.name = newName //내용 업데이트
        item.date = Date() //시간 업데이트
        do{
            try context.save()
        }
        catch{
            
        }
        getAllItems()
    }

}

