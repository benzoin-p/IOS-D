//
//  Shop.swift
//  iBook
//
//  Created by benzoin_testtube on 2022/5/30.
//

import UIKit

class Shop: NSObject {
    var Img:UIImage?
    var bname:String?
    var price:Double?
    var uname:String?
    var bid:String?
    
    var cover:String?
    var priceStr:String?
    
    init(uname:String?,bid:String?) {
        super.init()
        let sqt = SqliteTool()
        let result = sqt.executeSELECT(sql: "SELECT * FROM shop WHERE uname = '\(uname!)' AND bid = '\(bid!)'" )
        if(result.isFinish)
        {
            self.uname = result.dict!["uname"]
            self.bid = result.dict!["bid"]
            self.bname = result.dict!["bname"]
            self.priceStr = result.dict!["price"]
            self.cover = result.dict!["cover"]
        }
        else
        {
            print("找不到该书")
        }

    }
}
