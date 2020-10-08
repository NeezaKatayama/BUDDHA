//
//  CollectionViewCellController.swift
//  BUDDHA
//
//  Created by 片山義仁 on 2020/08/26.
//  Copyright © 2020 Neeza. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
   
    required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)

         
           // cellを丸くする
           self.layer.cornerRadius = 8.0
    
        
    }
    
    
    
    
}
