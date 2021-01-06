//
//  AddViewController.swift
//  BUDDHA
//
//  Created by 片山義仁 on 2020/01/13.
//  Copyright © 2020 Neeza. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    @IBOutlet var contentTextView: UITextView!
    @IBOutlet var imagePickerController: UIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var button: UIButton!
  
    
    var image: UIImage!
    var feelingNumber: Int!
    var auth: Auth!
    var ref: DatabaseReference!

  


 override func viewDidLoad() {
        super.viewDidLoad()
        auth = Auth.auth()
        showImagePicker()
    self.imageView.layer.cornerRadius = 30
    self.contentTextView.layer.cornerRadius = 30
    self.contentTextView.layer.borderWidth = 1.5// 枠線の幅
    self.contentTextView.layer.borderColor = UIColor.black.cgColor    // 枠線の色
    self.contentTextView.delegate = self
   
        let toolBar = UIToolbar() // キーボードの上に置くツールバーの生成
        let flexibleSpaceBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) // 今回は、右端にDoneボタンを置きたいので、左に空白を入れる
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard)) // Doneボタン
        toolBar.items = [flexibleSpaceBarButton, doneButton] // ツールバーにボタンを配置
        toolBar.sizeToFit()
        contentTextView.inputAccessoryView = toolBar // テキストビューにツールバーをセット
    
    }
    
    
    //メソッド：showimagepicker
    func showImagePicker() {
        //pickercontrollerを宣言
        let pickerController = UIImagePickerController()
        //photolibraryないから画像をとる
        pickerController.sourceType = .photoLibrary
        //曖昧〜
        pickerController.delegate = self
        //pickercontrollerが現れる
        present(pickerController, animated: true, completion: nil)
    }
    
    func showSimpleAlert(title: String, message: String) {
        //アラートの型的な物の宣言
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        //アラートを出す
        present(alertController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        image = (info[.originalImage] as! UIImage)
        imageView.image = image
        
        dismiss(animated: true, completion: nil)
    }
    //写真変更
    @IBAction func touchUpInsideChangeButton() {
        //メソッド：showimagepicker
        showImagePicker()
    }
    
    @IBAction func postContent() {
        ref = Database.database().reference()
        guard let key = ref.child("posts").childByAutoId().key else { return }
        let content = contentTextView.text!
        //let saveDocument = Firestore.firestore().collection("posts").document()//変更完了
        let saveDocument = self.ref.child("posts").child(key)
        if  image != nil {
            
           
            let data = image.jpegData(compressionQuality: 0.3)!
            let storage = Storage.storage()
            let storageRef = storage.reference()
            //let imageName = saveDocument.documentID + ".jpeg"
            let imageName = key + ".jpeg"
            var imagesRef = storageRef.child(imageName)
            _ = imagesRef.putData(data, metadata: nil) { (metadata, error) in //返り値を使ってない
                guard let metadata = metadata else {
                    return
                }
                
                imagesRef.downloadURL { (url, error) in
                    guard let downloadURL = url else {
                        return
                    }
                    
                    saveDocument.setValue([
                        "content": content,
                        "postID": key,
                        "createdAt": ServerValue.timestamp(),
                        "updatedAt": ServerValue.timestamp(),
                        "ImageURL": downloadURL.absoluteString,
                        "FeelingType": self.feelingNumber,
                        "userID":  self.auth.currentUser?.uid
                    ]) { (error:Error?, ref:DatabaseReference) in                        if error == nil {
                           self.navigationController?.popToRootViewController(animated: true)
                          
                        
                        } else {
                            print(error!)
                        }
                    }
                    
                }
                
            }
            button.isEnabled = false
            
        } else {
            showSimpleAlert(title: "画像が選択されていません", message: "画像を選択してください。")
            return
        }
        
    }
    
    
   
    
   
    
   
    @objc func dismissKeyboard(_ textField: UITextField) -> Bool {
           // キーボードを閉じる
        self.view.endEditing(true)
    }
    func performSegueToblankblank() {
        performSegue(withIdentifier: "toblankblank", sender: nil)
        
    }
    
    
    
}
