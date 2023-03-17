//
//  User.swift
//  iBook
//
//  Created by benzoin_testtube on 2022/5/31.
//

import UIKit

class User: NSObject {

    static var uname:String?
    
    
    init(uname:String?) {
        super.init()
        User.uname = uname
    }
    
    override init() {
        super.init()
    }
    
    func setUname(uname:String?){
        User.uname = uname
    }
}
