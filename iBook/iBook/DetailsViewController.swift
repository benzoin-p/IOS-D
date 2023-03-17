//
//  DetailsViewController.swift
//  iBook
//
//  Created by benzoin_testtube on 2022/5/29.
//  用于图书展示中的详细信息页

import UIKit

class DetailsViewController: UIViewController {

    var bid = "0"
    
    //var unameA3:String?
    var user:User?
    
    var bnameStr:String?
    
    var priceStr:String?
    
    var coverStr:String?
    
    @IBOutlet weak var Img: UIImageView!

    @IBOutlet weak var bname: UILabel!
    
    @IBOutlet weak var author: UILabel!
    
    @IBOutlet weak var price: UILabel!

    @IBOutlet weak var bidLabel: UILabel!
    
    @IBOutlet weak var intro: UILabel!
    
    let sqt = SqliteTool()
    
    let actioncreater = ActionCreater()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //print(unameA3 ?? "nil")
        
        let book = Book(bid: bid)
       
        if let url = NSURL(string: book.cover!) {
            if let data = NSData(contentsOf: url as URL) {
                Img.image = UIImage(data: data as Data)
            }
        }
       
        bnameStr = book.bname
        priceStr = book.priceStr
        coverStr = book.cover
        
        bname.text = "姓名：" + book.bname!
        author.text = "作者：" + book.author!
        price.text = "价格：" + book.priceStr!
        bidLabel.text = "书号：" + book.bid!
        intro.text = "详细介绍：" + book.intro!

        
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func pressBuyBtn(_ sender: Any) {
        let msg = "加入购物车成功"
        
        if (sqt.execute(sql: "INSERT INTO shop(bid,bname,uname,price,cover) VALUES('\(bid)','\(bnameStr!)','\(User.uname!)','\(priceStr!)','\(coverStr!)')"))
        {
            print("插入数据成功")
            let a = actioncreater.createAlterController(msg: msg)
            self.present(a, animated: true, completion: nil)
            //let sctvc = ShoppingCartTableViewController()
            //sctvc.reload()
        }
        else
        {
            print("插入数据失败")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
