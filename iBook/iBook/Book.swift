//
//  Book.swift
//  iBook
//
//  Created by benzoin_testtube on 2022/5/28.
//  书本实体类
//

import UIKit

class Book: NSObject {
    var Img:UIImage?
    var bname:String?
    var price:Double?
    var author:String?
    var bid:String?
    var intro:String?
    var type:String?
    
    var cover:String?
    var priceStr:String?
    
    init(bid:String?) {
        super.init()
        let sqt = SqliteTool()
        let result = sqt.executeSELECT(sql: "SELECT * FROM book WHERE bid = '\(bid!)'" )
        if(result.isFinish)
        {
            self.bid = result.dict!["bid"]
            self.bname = result.dict!["bname"]
            self.priceStr = result.dict!["price"]
            self.author = result.dict!["author"]
            self.intro = result.dict!["intro"]
            self.cover = result.dict!["cover"]
            self.type = result.dict!["type"]

            
        }
        else
        {
            print("找不到该书")
        }

    }

}
