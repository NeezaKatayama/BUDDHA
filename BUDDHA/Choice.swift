//
//  Choice.swift
//  BUDDHA
//
//  Created by 片山義仁 on 2020/09/16.
//  Copyright © 2020 Neeza. All rights reserved.
//

import UIKit

class Choice: UICollectionViewFlowLayout {
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return proposedContentOffset }

        // sectionInset を考慮して表示領域を拡大する
        let expansionMargin = sectionInset.left + sectionInset.right
        let expandedVisibleRect = CGRect(x: collectionView.contentOffset.x - expansionMargin,
                                          y: 0,
                                          width: collectionView.bounds.width + (expansionMargin * 2),
                                          height: collectionView.bounds.height)

        // 表示領域の layoutAttributes を取得し、X座標でソートする
        guard let targetAttributes = layoutAttributesForElements(in: expandedVisibleRect)?
            .sorted(by: { $0.frame.minX < $1.frame.minX }) else { return proposedContentOffset }

        let nextAttributes: UICollectionViewLayoutAttributes?
        /*if velocity.x == 0 {
            // スワイプせずに指を離した場合は、画面中央から一番近い要素を取得する
            nextAttributes = layoutAttributesForNearbyCenterX(in: targetAttributes, collectionView: collectionView)
        } else
            */if velocity.x > 0 {
            // 左スワイプの場合は、最後の要素を取得する
            nextAttributes = targetAttributes.last
        } else {
            // 右スワイプの場合は、先頭の要素を取得する
            nextAttributes = targetAttributes.first
        }
        guard let attributes = nextAttributes else { return proposedContentOffset }

        if attributes.representedElementKind == UICollectionView.elementKindSectionHeader {
            // ヘッダーの場合は先頭の座標を返す
            return CGPoint(x: 0, y: collectionView.contentOffset.y)
        } else {
            // 画面左端からセルのマージンを引いた座標を返して画面中央に表示されるようにする
            let cellLeftMargin = (collectionView.bounds.width - attributes.bounds.width) * 0.5
            return CGPoint(x: attributes.frame.minX - cellLeftMargin, y: collectionView.contentOffset.y)
        }
    }

    // 画面中央に一番近いセルの attributes を取得する
   /* private func layoutAttributesForNearbyCenterX(in attributes: [UICollectionViewLayoutAttributes], collectionView: UICollectionView) -> UICollectionViewLayoutAttributes? {
        var perfectVisibleCells = collectionView.visibleCells.filter {
            return collectionView.bounds.contains($0.frame)
           }
        _ = layoutAttributesForElements
        
       perfectVisibleCells = layoutAttributesForElements
}*/
    

}
