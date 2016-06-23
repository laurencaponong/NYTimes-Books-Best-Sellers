//
//  AFWrapper.swift
//  NYTimes-Books
//
//  Created by Lauren Caponong on 6/21/16.
//  Copyright © 2016 Lauren Caponong. All rights reserved.
//

import Foundation
import Alamofire

let APIkey = "f11d1bd9e15f444b934798db4f137d9d"
var requestString = "http://api.nytimes.com/svc/books/v3/lists/2016-01-11/e-book-fiction?api-key=\(APIkey)"

class AFWrapper: NSObject {
    
    class func getDataFromAPI(closure: (dict: Dictionary<String, AnyObject>) -> Void) {
        Alamofire.request(.GET, requestString).responseJSON { (response) in
            if let json = response.result.value as? Dictionary<String, AnyObject> {
                closure(dict: json)
            }
        }
    }
}