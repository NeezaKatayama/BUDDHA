//
//  TimelineViewController.swift
//  BUDDHA
//
//  Created by 片山義仁 on 2019/12/11.
//  Copyright © 2019 Neeza. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import Kingfisher



class TimelineViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    

    var giveData: Post!
    var feelingNumber: Int!
    var feelingType: FeelingType!
    let Color = UIColor(named: "customColor")
    var actUser: Int!
    var ref: DatabaseReference!
    
   

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
      let url = URL(string: postArray[indexPath.row].imageURL)
        cell.imageView.kf.setImage(with: url)
          cell.backgroundColor = Color
            return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
              let cellSize:CGFloat = self.view.bounds.width/4
             
              return CGSize(width: cellSize, height: cellSize)
    }
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
  
    var database: Firestore!
    var postArray: [Post] = []
    var imageNameArray = [String]()
    var selectedImage: UIImage!
    var auth: Auth!
   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        
      

        ref = Database.database().reference()//リアル
        database = Firestore.firestore()//データ構造依存
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = layout
        self.collectionView.backgroundColor = Color
        self.view.backgroundColor = Color
      
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        auth = Auth.auth()
        
    }
  
       
    
    
    
  
  
        
        
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let postsRef = self.database.collection("posts")//失敗
        
        postsRef.order(by: "createdAt", descending: true).getDocuments { (snapshot, error) in //データ構造依存箇所
           
            if error == nil, let snapshot = snapshot {

                self.postArray = []
                for document in snapshot.documents {
                    let data = document.data()
                    let post = Post(data: data)
                    
                    
                    if self.actUser == 2 && post.feelingType.rawValue == self.feelingNumber &&  post.userID == self.auth.currentUser!.uid{
                        self.postArray.append(post)
                       
                        
                    }
                    else if self.actUser == 1 && post.feelingType.rawValue == self.feelingNumber {
                        self.postArray.append(post)
                    }
                }
                self.collectionView.reloadData()
                
                
            }
            
            
            
        }
      
        
    }
    
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
            giveData = postArray[indexPath.row]
        
        
           
               performSegue(withIdentifier: "toDetail",sender: nil)
          
        
       
       }
    
   
     
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "toDetail" {
               let vc = segue.destination as! DetailViewController
               vc.receiveData = giveData
             
               
           }
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


  
