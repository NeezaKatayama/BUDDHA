//
//  ChoiceCollectionViewController.swift
//  
//
//  Created by 片山義仁 on 2020/09/16.
//

import UIKit

private let reuseIdentifier = "ChoiceCell"

class ChoiceCollectionViewController: UICollectionViewController {
   let Color = UIColor(named: "customColor")
    override func viewDidLoad() {
        super.viewDidLoad()
        let Color = UIColor(named: "customColor")
        //collectionView.dataSource = self
        //collectionView.backgroundColor = Color
       
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let layout = Choice()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 200)
        layout.minimumInteritemSpacing = collectionView.bounds.height
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        collectionView.decelerationRate = .fast
        collectionView.collectionViewLayout = layout
        
    }

  

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        
    
        return cell
    }

   

 

}
