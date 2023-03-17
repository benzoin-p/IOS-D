//
//  Sql.swift
//  iBook
//
//  Created by benzoin_testtube on 2022/5/25.
// 仅试验用，不再使用
//

import UIKit
import SQLite3

class Sql: NSObject {
    var dbName:String
    var path = "/Users/benzoin/Desktop/iBook/iBook/db"
    var dbHandler:OpaquePointer? = nil
    init(dbname:String)
    {
        self.dbName = dbname
    }
    
    func OpenDataBase(){
        let dataPath = "\(path)/\(dbName)"
        let result = sqlite3_open(dataPath, &dbHandler)
        print(dataPath)
        if result != SQLITE_OK{
            print("open data base false")
        }else{
            print("open data base true")
        }
    }
    
    func CreateTable(sql:String){
        let result = sqlite3_exec(dbHandler, sql, nil, nil, nil)
        if result != SQLITE_OK{
            print("create table false")
        }else{
            print("create table true")
        }
        
    }
    
    func InsertData(sql:String){
        let result = sqlite3_exec(dbHandler, sql, nil, nil, nil)
        if result != SQLITE_OK{
            print("create table false")
        }else{
            print("create table true")
        }
        
    }

}

