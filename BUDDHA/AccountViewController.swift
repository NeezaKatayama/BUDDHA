//
//  AccountViewController.swift
//  BUDDHA
//
//  Created by 片山義仁 on 2019/12/11.
//  Copyright © 2019 Neeza. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AccountViewController: UIViewController {
    
    var auth: Auth!
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var registerAccount: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        auth = Auth.auth()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        registerAccount.layer.cornerRadius = 10
        
        
       
    }
    /*override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if auth.currentUser != nil {
            // もし既にユーザーにログインができていれば、タイムラインの画面に遷移する。
            // このときに、ユーザーの情報を次の画面の変数に値渡ししておく。(直接取得することも可能。)
            auth.currentUser?.reload(completion: { error in
                if error == nil {
                    if self.auth.currentUser?.isEmailVerified == true {
                        self.dismiss(animated: true, completion: nil)
                    } else if self.auth.currentUser?.isEmailVerified == false {
                        let alert = UIAlertController(title: "確認用のメールを送信したから見てみて。", message: "まだメール認証終わってないよ！", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        
                    }
                }
           })
            
        }
        
        
    }*/
  
     
    @IBAction func registerAccountTapped() {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        auth.createUser(withEmail: email, password: password) { (result, error) in
            if error == nil, let _ = result {
                //result.user.sendEmailVerification(completion: { (error) in
                    //if error == nil {
                     // let alert = UIAlertController(title: "登録完了。", message: "入力したメールアドレス宛に確認のメール送りました。。", preferredStyle: .alert)
                       // alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                       // self.present(alert, animated: true, completion: nil)
                        
                self.dismiss(animated: true, completion: nil)
                
                   // }
               // })
            }else {
                let alert = UIAlertController(title: "エラー", message: "そのメールアドレスは使用できません。", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
            }
        }
        
       
       
        
    }
    
   
    
    
    
 
    
    
    
}

extension AccountViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



