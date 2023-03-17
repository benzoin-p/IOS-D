//
//  ActionCreater.swift
//  iBook
//
//  Created by benzoin_testtube on 2022/5/25.
// 用于产生警告弹窗的类

import UIKit

class ActionCreater: NSObject {
    override init(){
        super.init()
        
    }
    
    //以下是重载方法
    func createAlterController(title:String,msg:String,cancelmsg:String)->UIAlertController{
        let alertController = UIAlertController(title: title, message: msg,preferredStyle: .alert)
        let cancelAction1 = UIAlertAction(title: cancelmsg, style: .destructive, handler: nil)
        alertController.addAction(cancelAction1)
        return alertController
    }
    
    func createAlterController(msg:String)->UIAlertController{
        let alertController = UIAlertController(title: "提示", message: msg,preferredStyle: .alert)
        let cancelAction1 = UIAlertAction(title: "好了好了，我知道了", style: .destructive, handler: nil)
        alertController.addAction(cancelAction1)
        return alertController
    }
    
    func createAlterController(title:String,msg:String,cancelmsg1:String,cancelmsg2:String)->UIAlertController{
        let alertController = UIAlertController(title: title, message: msg,preferredStyle: .alert)
        let cancelAction1 = UIAlertAction(title: cancelmsg1, style: .destructive, handler: nil)
        let cancelAction2 = UIAlertAction(title: cancelmsg2, style: .destructive, handler: nil)
        alertController.addAction(cancelAction1)
        alertController.addAction(cancelAction2)
        return alertController
    }
    
    

}
