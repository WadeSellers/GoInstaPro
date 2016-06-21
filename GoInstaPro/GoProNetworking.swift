//
//  GoProNetworking.swift
//  GoInstaPro
//
//  Created by Wade Sellers on 6/21/16.
//  Copyright © 2016 Wade Sellers. All rights reserved.
//

/*
 To ensure proper JSON navigation, these are the print statements we can use to find data we care about
 1) print("ImageURL: \(result["images"]["standard_resolution"]["url"])")
 2) print("Comments: \(result["comments"]["count"].stringValue)")
 3) print("Likes: \(result["likes"]["count"].stringValue)")
 */

import UIKit
import Alamofire
import SwiftyJSON

class GoProNetworking: NSObject {

    static let goProUrl = "https://www.instagram.com/gopro/media/"

    class func getGoProData(completionHandler : ((imageItemArray:[ImageItem]) -> Void)) -> [ImageItem] {

        let queue = dispatch_queue_create("com.WadeSellers.GoInstaPro.background", DISPATCH_QUEUE_CONCURRENT)

        var imageItemArray:[ImageItem] = [ImageItem]()

        let request = Alamofire.request(.GET, goProUrl, parameters: nil)
        request.response(
            queue: queue,
            responseSerializer: Request.JSONResponseSerializer(options: .AllowFragments),
            completionHandler: { response in
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        for result in json["items"].arrayValue {
                            let imageItem = ImageItem(json: result)
                            imageItemArray.append(imageItem)
                        }
                        return completionHandler(imageItemArray:imageItemArray)
                    }
                case .Failure(let error):
                    print("Error when retrieving GoPro info: \(error)")
                }
            }
        )
    return imageItemArray
    }

}
