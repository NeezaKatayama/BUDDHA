//
//  MyNavigationViewController.swift
//  BUDDHA
//
//  Created by 片山義仁 on 2020/09/06.
//  Copyright © 2020 Neeza. All rights reserved.
//

import UIKit

class MyNavigationViewController: UINavigationController {
    
    let Color = UIColor(named: "customColor")

    override func viewDidLoad() {
        super.viewDidLoad()
        
          
        navigationBar.barTintColor = Color
            navigationBar.tintColor = .black
           
            navigationBar.titleTextAttributes = [
                
                .foregroundColor: UIColor.black
            ]
            // Do any additional setup after loading the view.
        }
        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
