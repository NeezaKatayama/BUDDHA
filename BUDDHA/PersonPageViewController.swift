//
//  PersonPageViewController.swift
//  BUDDHA
//
//  Created by 片山義仁 on 2020/09/28.
//  Copyright © 2020 Neeza. All rights reserved.
//

import UIKit

class PersonPageViewController: UIPageViewController{
    
    
    var pageViewControllers: [UIViewController] = []
    var nowPage: Int = 0
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
     let pageViewA = storyboard!.instantiateViewController(withIdentifier: "SeparateViewController1") as! SeparateViewController1
     let pageViewB = storyboard!.instantiateViewController(withIdentifier: "SeparateViewController2") as! SeparateViewController2
    pageViewControllers = [pageViewA, pageViewB]
        self.setViewControllers([pageViewControllers[0]], direction: .forward, animated: true, completion: nil)
    
    pageViewA.onButtonTapped = {
        self.currentPage = 1
        self.setViewControllers([self.pageViewControllers[1]], direction: .forward, animated: true, completion: nil)
               }
    pageViewB.onButtonTapped = {
        self.currentPage = 2
        self.setViewControllers([self.pageViewControllers[0]], direction: .forward, animated: true, completion: nil)
               }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = pageViewControllers.firstIndex(of: viewController)
        if index == 0 {
            return nil
        } else {
            return pageViewControllers[index!-1]
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = pageViewControllers.firstIndex(of: viewController)
        if index == pageViewControllers.count - 1 {
            return nil
        } else {
            return pageViewControllers[index!+1]
        }
    }
    
    
    override func didReceiveMemoryWarning() {
               super.didReceiveMemoryWarning()
           }
    }




    
  

