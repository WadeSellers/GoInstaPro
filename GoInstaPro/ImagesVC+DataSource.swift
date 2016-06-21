//
//  ImagesVC+DataSource.swift
//  GoInstaPro
//
//  Created by Wade Sellers on 6/21/16.
//  Copyright © 2016 Wade Sellers. All rights reserved.
//

import Foundation
import UIKit

extension ImagesViewController: UICollectionViewDataSource {

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if imageItems.count > 0 {
            return imageItems.count
        } else {
            return 10
        }
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ImageCollectionViewCell
        if imageItems.count > 0 {
            cell.countLabel.hidden = false
            cell.imageView.image = imageItems[indexPath.item].image
            cell.countLabel.text = setLabelText(imageItems[indexPath.item])
        } else {
            cell.imageView.image = UIImage(named: "placeholderLogo320x320")
            cell.countLabel.hidden = true
        }

        return cell
    }

    func setLabelText(imageItem:ImageItem) -> String {
        if currentSortParameter == .likes {
            return String(imageItem.likes!)
        } else {
            return String(imageItem.comments!)
        }
    }

    func reloadCollectionView() {
        dispatch_async(dispatch_get_main_queue(), {
            self.imagesCollectionView.reloadData()
        })
    }

}