//
//  ChoiceViewController.swift
//  BUDDHA
//
//  Created by 片山義仁 on 2020/07/15.
//  Copyright © 2020 Neeza. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class ChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    @IBOutlet var happyButton: UIButton!
    @IBOutlet var loveButton: UIButton!
    @IBOutlet var angryButton: UIButton!
    @IBOutlet var funnyButton: UIButton!
    @IBOutlet var sadButton: UIButton!
    @IBOutlet var envyButton: UIButton!
    @IBOutlet var surpriseButton: UIButton!
    @IBOutlet var nothingButton: UIButton!
    
    var feelingNumber: Int!
    
    
    
    
    @IBAction func choiceFeeling(sender: UIButton) {
        
       feelingNumber = sender.tag
       performSegue(withIdentifier: "toAddView", sender: nil)
        
       }
       

        
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddView" {
        let addViewController: AddViewController =
        segue.destination as! AddViewController
        addViewController.feelingNumber = self.feelingNumber
        }
        
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


