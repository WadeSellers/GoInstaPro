//
//  ImagesVC+Delegate.swift
//  GoInstaPro
//
//  Created by Wade Sellers on 6/21/16.
//  Copyright © 2016 Wade Sellers. All rights reserved.
//

import Foundation
import UIKit

extension ImagesViewController: UICollectionViewDelegate {

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell at indexPath: \(indexPath.item)")
    }


}