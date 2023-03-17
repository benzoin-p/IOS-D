//
//  HistoryBook.swift
//  iBook
//
//  Created by benzoin_testtube on 2022/6/3.
//

import UIKit

class HistoryBook: NSObject {
    var hid:String?
    var bname:String?
    
    init(hid:String?,bname:String?){
        super.init()
        self.hid = hid
        self.bname = bname
    }

}
