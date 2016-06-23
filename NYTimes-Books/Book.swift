//
//  Book.swift
//  NYTimes-Books
//
//  Created by Lauren Caponong on 6/21/16.
//  Copyright © 2016 Lauren Caponong. All rights reserved.
//

import Foundation
import UIKit

class Book {
    
    let title: String
    let author: String
    var description: String? = nil
    var category: String? = nil
    var imageURL: String? = nil

    class func booksFromJSON(json: Dictionary<String, AnyObject>) -> [Book] {
        
        var books = [Book]()
        
        if let results = json["results"] as? Dictionary<String, AnyObject> {
            if let booksFromResults = results["books"] as? [AnyObject] {
            for i in 0..<booksFromResults.count {
                if let dictOfBook = booksFromResults[i] as? AnyObject {
                    let bookTitle = dictOfBook["title"] as! String
                    let bookAuthor = dictOfBook["author"] as! String
                    let bookDesc = dictOfBook["description"] as? String
                    let bookCategory = dictOfBook["list_name"] as? String
                    let bookImageURL = dictOfBook["book_image"] as? String
                    books.append(Book.init(title: bookTitle, author: bookAuthor, description: bookDesc, category: bookCategory, imageURL: bookImageURL))
                    }
                }
            }
        
            
        }
        return books
        
    }
    
    init(title: String, author: String, description: String?, category: String?, imageURL: String?) {
        
        self.title = title
        self.author = author
        if let desc = description {
            self.description = desc
        }
        
        if let cat = category {
            self.category = cat
        }
        
        
        if let url = imageURL {
            self.imageURL = url
        }
    }
    
    
}