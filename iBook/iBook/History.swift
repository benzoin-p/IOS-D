//
//  History.swift
//  iBook
//
//  Created by benzoin_testtube on 2022/6/3.
//

import UIKit

class History: NSObject {
    var hid:String?
    var bnum:String?
    var uname:String?
    var totalprice:String?
    var time:String?
    
    init(hid:String?,uname:String?){
        super.init()
        let sqt = SqliteTool()
        let result = sqt.executeSELECT(sql: "SELECT* FROM history WHERE hid = '\(hid!)' AND uname = '\(uname!)'")
        if(result.isFinish)
        {
            self.uname = result.dict!["uname"]
            self.bnum = result.dict!["bnum"]
            self.hid = result.dict!["hid"]
            self.totalprice = result.dict!["totalprice"]
            self.time = result.dict!["time"]
        }
        else
        {
            print("找不到该订单")
        }
    }

}
