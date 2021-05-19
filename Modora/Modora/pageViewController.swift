//
//  pageViewController.swift
//  Modora
//
//  Created by 송영욱 on 2021/05/19.
//

import UIKit

class pageViewController: UIPageViewController, UIPageViewControllerDataSource , UIPageViewControllerDelegate {
    
    var completeHandler : ((Int)->())?
    
    var currentIndex : Int {
            guard let vc = viewControllers?.first else { return 0 }
            return viewsList.firstIndex(of: vc) ?? 0
        }
    
    let viewsList : [UIViewController] = {
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
           
            let vc1 = storyBoard.instantiateViewController(withIdentifier: "first")
            let vc2 = storyBoard.instantiateViewController(withIdentifier: "second")
            let vc3 = storyBoard.instantiateViewController(withIdentifier: "third")
            
            return [vc1, vc2, vc3]
            
        }()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewsList.firstIndex(of: viewController) else {return nil}
                
        let previousIndex = index - 1
        
        if previousIndex < 0 {return nil}
        
        return viewsList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewsList.firstIndex(of: viewController) else {return nil}
                      
        let nextIndex = index + 1
              
        if nextIndex == viewsList.count { return nil}
              
        return viewsList[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
                    
                    completeHandler?(currentIndex)
                }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        if let firstvc = viewsList.first {
            self.setViewControllers([firstvc], direction: .forward, animated: true, completion: nil)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
