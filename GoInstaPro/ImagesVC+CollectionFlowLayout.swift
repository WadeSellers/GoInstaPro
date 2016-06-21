//
//  ImagesVC+CollectionFlowLayout.swift
//  GoInstaPro
//
//  Created by Wade Sellers on 6/21/16.
//  Copyright © 2016 Wade Sellers. All rights reserved.
//

import Foundation
import UIKit

extension ImagesViewController {

    // Collection view flow layout setup

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenSize = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let cellSquareSize: CGFloat = screenWidth / 2.0
        return CGSizeMake(cellSquareSize, cellSquareSize);
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0.0, 0.0)
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }

}
