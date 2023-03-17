//
//  ViewController.swift
//  iBook
//
//  Created by benzoin_testtube on 2022/5/15.
//  记得用iPhone11进行演示
//

import UIKit
import SQLite3

class ViewController: UIViewController {

    

    @IBOutlet weak var NameField: UITextField!
    
    @IBOutlet weak var PasswordField: UITextField!
    
    @IBOutlet weak var RegisterBtn: UIButton!
    
    @IBOutlet weak var LinkBtn: UIButton!
    
    @IBOutlet var TGR: UITapGestureRecognizer!
    
    var name:String?
    
    var password:String?
    
    let sqt = SqliteTool()
    
    let actioncreater = ActionCreater()
    
    var UserDefaults:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addGestureRecognizer(TGR)
        //sqt.createTable(sql: "CREATE TABLE IF NOT EXISTS user(uname TEXT PRIMARY KEY,password TEXT);")
        //sqt.createTable(sql: "CREATE TABLE IF NOT EXISTS book(bid TEXT PRIMARY KEY,bname TEXT,author TEXT,intro TEXT,price TEXT,cover TEXT,type TEXT);")
        //sqt.createTable(sql: "CREATE TABLE IF NOT EXISTS shop(bid TEXT,bname TEXT,uname TEXT,price TEXT,cover TEXT,PRIMARY KEY(bid,uname));")
       //let ibc = InsertBookClass()
        //ibc.insertBook()
        //sqt.createTable(sql: "CREATE TABLE IF NOT EXISTS history(hid TEXT,bnum TEXT,uname TEXT,totalprice TEXT,time TEXT,PRIMARY KEY(hid));")
       // sqt.createTable(sql: "CREATE TABLE IF NOT EXISTS historyBook(hid TEXT,bname TEXT,PRIMARY KEY(hid,bname));")
        NameField.text = UserDefaults
        
    }
    
    
    
    @IBAction func textFieldDoneEditing(_ sender: UITextField) {
        //完成后关闭键盘
        sender.resignFirstResponder()
        let s:String? = sender.text
        //print(s!)
        loadNameAndPassword(sender, s: s)
    }
    
    
    
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        NameField.resignFirstResponder()
        PasswordField.resignFirstResponder()
        loadNameAndPassword(NameField, s: NameField.text)
        loadNameAndPassword(PasswordField, s: PasswordField.text)
    }
    
    
    @IBAction func PressRegBtn(_ sender: UIButton) {
        //print(sender.titleLabel!.text!)
        //判空
        if((name == nil || password == nil)||(NameField.text!.isEmpty||PasswordField.text!.isEmpty))
        {
            let a = actioncreater.createAlterController(msg: "请确保填入内容")
            self.present(a, animated: true, completion: nil)
            return;
        }
        //生成提示信息
        let msg1 = self.NameField.text!.isEmpty
        ? "未填入用户名"
        : self.name! + "已注册"
        
        let msg2 = "注册成功"
        
        if (sqt.execute(sql: "INSERT INTO user(uname,password) VALUES('\(name!)','\(password!)')"))
        {
            print("插入数据成功")
            let a = actioncreater.createAlterController(msg: msg2)
            self.present(a, animated: true, completion: nil)
        }
        else
        {
            print("插入数据失败")
            let a = actioncreater.createAlterController(msg: msg1)
            self.present(a, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func PressLinkBtn(_ sender: UIButton) {
        //print(sender.titleLabel!.text!)
        //判空
        if((name == nil || password == nil)||(NameField.text!.isEmpty||PasswordField.text!.isEmpty))
        {
            let a = actioncreater.createAlterController(msg: "请确保填入内容")
            self.present(a, animated: true, completion: nil)
            return;
        }
        
        let msg = "账号或密码错误"
        
        if (sqt.executeSELECT(sql: "SELECT uname,password FROM user WHERE uname = '\(name!)' AND password = '\(password!)';", value1: name!, value2: password!))
        {
            UserDefaults = name
            print("登陆成功")
        }
        else
        {
            print("登陆失败")
            
            let a = actioncreater.createAlterController(msg: msg)
            self.present(a, animated: true, completion: nil)
        }
    }
    
    //传参的函数
    func loadNameAndPassword(_ sender:UITextField,s:String?){
        if sender == NameField {
            name=s
            //print("name="+name!)
        } else {
            password=s
            //print("password="+password!)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! TabBarController
        let user = User(uname: name!)
        vc.user = user
    }
    

    
}










