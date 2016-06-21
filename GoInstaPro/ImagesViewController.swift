//
//  ImagesViewController.swift
//  GoInstaPro
//
//  Created by Wade Sellers on 6/20/16.
//  Copyright © 2016 Wade Sellers. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

enum SortBy {
    case likes
    case comments
}

class ImagesViewController: UIViewController {

    let reuseIdentifier = "imageCollectionViewCell"
    let collectionRefreshControl = UIRefreshControl()
    var imageItems:[ImageItem] = []
    var currentSortParameter:SortBy = .likes

    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var likeCommentSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        getimageItems()
    }

    // MARK: Image Items Helper Function
    func getimageItems() {
        GoProNetworking.getGoProData { (imageItemArray) in
            self.imageItems = imageItemArray
            self.sortImageItemsBy(self.currentSortParameter)
            self.reloadCollectionView()
            if self.collectionRefreshControl.refreshing {
                self.collectionRefreshControl.endRefreshing()
            }
        }
    }

    // MARK: Segmented Control Function
    @IBAction func onLikeCommentSegmentedControlTapped(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            currentSortParameter = .likes
        } else {
            currentSortParameter = .comments
        }
        sortImageItemsBy(currentSortParameter)
    }

    // MARK: Sort Data helper method
    func sortImageItemsBy(sortBy: SortBy) {
        switch sortBy {
        case .likes:
            imageItems = imageItems.sort({ $0.likes < $1.likes })
        case .comments:
            imageItems = imageItems.sort({ $0.comments < $1.comments })
        }
        reloadCollectionView()
    }

    func setupRefreshControl() {
        collectionRefreshControl.tintColor = UIColor.whiteColor()
        collectionRefreshControl.backgroundColor = UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        collectionRefreshControl.addTarget(self, action: #selector(collectionRefreshControlAction) , forControlEvents: .ValueChanged)
        imagesCollectionView.addSubview(collectionRefreshControl)
        imagesCollectionView.alwaysBounceVertical = true
    }

    func collectionRefreshControlAction() {
        getimageItems()
    }

}

