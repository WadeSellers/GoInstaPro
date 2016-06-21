//
//  ImageItem.swift
//  GoInstaPro
//
//  Created by Wade Sellers on 6/20/16.
//  Copyright © 2016 Wade Sellers. All rights reserved.
//

import UIKit
import SwiftyJSON

class ImageItem: NSObject {
    var likes:Int?
    var comments:Int?
    var image:UIImage?

    init(json:JSON) {
        super.init()
        likes = Int(json["likes"]["count"].stringValue)
        comments = Int(json["comments"]["count"].stringValue)

        let url = NSURL(string: json["images"]["low_resolution"]["url"].stringValue)
        let data = NSData(contentsOfURL: url!)
        image = UIImage(data: data!)
    }

}

