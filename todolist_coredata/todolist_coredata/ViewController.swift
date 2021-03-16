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
        tableview.delegate = self
        tableview.dataSource = self
        tableview.frame = view.bounds
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
    
    func getAllItems()
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
    }
    
    func updateItem(item: ToDoListItem, newName: String)
    {
        item.name = newName
        do{
            try context.save()
        }
        catch{
            
        }
    }

}

