//
//  tutorialViewController.swift
//  BUDDHA
//
//  Created by 片山義仁 on 2020/10/07.
//  Copyright © 2020 Neeza. All rights reserved.
//

import UIKit

class tutorialViewController: UIPageViewController, UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
            return self.controllers.count
        }
       
        /// 左にスワイプ（進む）
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            if let index = self.controllers.firstIndex(of: viewController),
                index < self.controllers.count - 1 {
                return self.controllers[index + 1]
            } else {
                return nil
            }
        }

        /// 右にスワイプ （戻る）
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            if let index = self.controllers.firstIndex(of: viewController),
                index > 0 {
                return self.controllers[index - 1]
            } else {
                return nil
            }
        }
    
    
    private var controllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initPageViewController()
        // Do any additional setup after loading the view.
    }
    
    
    private func initPageViewController() {

            // ② PageViewControllerで表示するViewControllerをインスタンス化する
            let firstVC = storyboard!.instantiateViewController(withIdentifier: "FirstView") as! FirstViewController
            let secondVC = storyboard!.instantiateViewController(withIdentifier: "SecondView") as! SecondViewController
            let ThirdVC = storyboard!.instantiateViewController(withIdentifier: "ThirdView") as! ThirdViewController

            // ③ インスタンス化したViewControllerを配列に保存する
            self.controllers = [ firstVC, secondVC, ThirdVC ]

            // ④ 最初に表示するViewControllerを指定する
            setViewControllers([self.controllers[0]], direction: .forward, animated: true, completion: nil)
           
            // ④ PageViewControllerのDataSourceを関連付ける
            self.dataSource = self
        }

    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


