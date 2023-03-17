//
//  SqliteTool.swift
//  iBook
//
//  Created by benzoin_testtube on 2022/5/25.
//

import UIKit
import SQLite3

class SqliteTool: NSObject {
    
    static let shareTool = SqliteTool()
    var db : OpaquePointer? = nil
    
    override init() {
        super.init()
        let path = "/Users/benzoin/Desktop/iBook/iBook/db/iBook.db"
        let result = sqlite3_open(path, &db)
        //print("创建数据库路径为："+path)
        if result != SQLITE_OK{
            print("创建数据库成功！")
        }else{
            //print("创建数据库失败或已创建！")
        }
    }
    
    //简化执行语句
    func execute(sql:String) -> Bool{
        return(sqlite3_exec(db, sql, nil, nil, nil) == SQLITE_OK)
    }
    
    //简化查询语句 用于验证登录
    func executeSELECT(sql:String,value1:String,value2:String)->Bool
    {
        var returnBool = false
        var stmt : OpaquePointer? = nil
        if(sqlite3_prepare_v2(db, sql, -1, &stmt, nil) != SQLITE_OK)
        {
            print("准备语句失败")
            return false
        }
        //当还有其它行时
        while sqlite3_step(stmt) == SQLITE_ROW
        {
            let columnCount = sqlite3_column_count(stmt)
            for i in 0..<columnCount
            {
                if(sqlite3_column_type(stmt, i)==SQLITE_TEXT)
                {
                    let value = sqlite3_column_text(stmt, i)
                    let valueStr = String(cString: value!)
                    if(i==0)
                    {
                        returnBool=isValueEqual(value: value1, getValue: valueStr)
                    }
                    else if(i==1)
                    {
                        returnBool=isValueEqual(value: value2, getValue: valueStr)
                    }
                }
            }
        }
        sqlite3_reset(stmt)
        sqlite3_finalize(stmt)
        return returnBool
    }
    
    //简化查询语句 通过字典返回键值对
    func executeSELECT(sql:String)->(isFinish:Bool,dict:[String:String]?)
    {
        var stmt : OpaquePointer? = nil
        var dict = [String:String]()
        if(sqlite3_prepare_v2(db, sql, -1, &stmt, nil) != SQLITE_OK)
        {
            print("准备语句失败")
            return (false,nil)
        }
        //当还有其它行时
        while sqlite3_step(stmt) == SQLITE_ROW
        {
            let columnCount = sqlite3_column_count(stmt)
            for i in 0..<columnCount
            {
                let columnName = sqlite3_column_name(stmt, i)
                let columnNameStr = String(cString: columnName!)
                var valueStr = ""
                if(sqlite3_column_type(stmt, i)==SQLITE_TEXT)
                {
                    let value = sqlite3_column_text(stmt, i)
                    valueStr = String(cString: value!)
                }
                dict.updateValue(valueStr, forKey: columnNameStr)
            }
        }
        sqlite3_reset(stmt)
        sqlite3_finalize(stmt)
        return (true,dict)
    }
    
    //通过数组返回查询结果
    func executeSELECTreturnArray(sql:String)->(isFinish:Bool,StrArray:[String]?)
    {
        var stmt : OpaquePointer? = nil
        var array = [String]()
        if(sqlite3_prepare_v2(db, sql, -1, &stmt, nil) != SQLITE_OK)
        {
            print("准备语句失败")
            return (false,nil)
        }
        //当还有其它行时
        while sqlite3_step(stmt) == SQLITE_ROW
        {
            let columnCount = sqlite3_column_count(stmt)
            for i in 0..<columnCount
            {
                var valueStr = ""
                if(sqlite3_column_type(stmt, i)==SQLITE_TEXT)
                {
                    let value = sqlite3_column_text(stmt, i)
                    valueStr = String(cString: value!)
                }
                array.append(valueStr)
            }
        }
        sqlite3_reset(stmt)
        sqlite3_finalize(stmt)
        return (true,array)
    }
    
    
    func isValueEqual(value:String,getValue:String)->Bool
    {
        return value==getValue
    }
    
    func createTable(sql:String){
        if execute(sql: sql){
            print("启动表成功")
        }
    }
}
