//
//  ShoppingCartTableViewController.swift
//  iBook
//
//  Created by benzoin_testtube on 2022/5/30.
//

import UIKit

class ShoppingCartTableViewController: UITableViewController {
    
    //var unameB:String?
    var user:User?
    
    var source:[Shop]?
    
    let sqt = SqliteTool()
    
    let actioncreater = ActionCreater()
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        source = []
        
        let result = sqt.executeSELECTreturnArray(sql: "SELECT bid FROM shop WHERE uname = '\(User.uname!)'")
        
        if(result.isFinish)
        {
            let count = result.StrArray?.count
            for i in 0..<count!
            {
                let bid = result.StrArray![i]
                source?.append(Shop(uname: User.uname!, bid: bid))
            }
        }
        
        //显示红点
        if(source!.count > 0)
        {
            self.tabBarItem.badgeValue = "\(source!.count)"
        }
        else
        {
            self.tabBarItem.badgeValue = nil

        }

       

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //不知道如何在点击购买后直接更新购物车view中的cell数目，只能点击两次才能更新
    //已修复，换成在viewDidAppear的时候就可以了，很神秘
    //其实原因还是。。。没更新cell的数目，蠢死了
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.reload()
    }
    
    /*
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.reload()
    }
     */
    
    /*
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        source = []
        
        let result = sqt.executeSELECTreturnArray(sql: "SELECT bid FROM shop WHERE uname = '\(unameB!)'")
        
        if(result.isFinish)
        {
            let count = result.StrArray?.count
            for i in 0..<count!
            {
                let bid = result.StrArray![i]
                source?.append(Shop(uname: unameB!, bid: bid))
            }
        }
    }
    */

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        //就是因为没有在这个地方进行重载行数！！！！！
        
        source = []
        
        let result = sqt.executeSELECTreturnArray(sql: "SELECT bid FROM shop WHERE uname = '\(User.uname!)'")
        
        if(result.isFinish)
        {
            let count = result.StrArray?.count
            for i in 0..<count!
            {
                let bid = result.StrArray![i]
                source?.append(Shop(uname: User.uname!, bid: bid))
            }
        }
        
        if(source!.count > 0)
        {
            self.tabBarItem.badgeValue = "\(source!.count)"
        }
        else
        {
            self.tabBarItem.badgeValue = nil

        }

        return source!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //用于刷新页面 干脆每次都重新读数据库 直接复制了 耦合度大大的增加了
      
        if(indexPath.row<source!.count)
        {
            //print(indexPath.row)
            let img = cell.viewWithTag(104) as! UIImageView
            //img.image = sourse![indexPath.row].Img
            if let url = NSURL(string: source![indexPath.row].cover!) {
                if let data = NSData(contentsOf: url as URL) {
                    img.image = UIImage(data: data as Data)
                }
            }
           
            
            let bname = cell.viewWithTag(101) as! UILabel
            bname.text = source![indexPath.row].bname
            
            let price = cell.viewWithTag(102) as! UILabel
            price.text = "价格："+source![indexPath.row].priceStr!
            
            let button = cell.viewWithTag(103) as! UIButton
            button.subtitleLabel?.text = source![indexPath.row].bid!

        }
        /*
        else
        {
            let img = cell.viewWithTag(104) as! UIImageView
            //img.image = sourse![indexPath.row].Img
            img.image = nil
           
            
            let bname = cell.viewWithTag(101) as! UILabel
            bname.text = nil
            
            let price = cell.viewWithTag(102) as! UILabel
            price.text = nil
            
            let button = cell.viewWithTag(103) as! UIButton
            button.isHidden = true
            
        }
         */
        
        // Configure the cell...

        return cell
    }
    
    @IBAction func pressDeleteBtn(_ sender: UIButton) {
        let bid = sender.subtitleLabel?.text
        let msg = "移出购物车成功"
        if(sqt.execute(sql: "DELETE FROM shop WHERE bid = '\(bid!)' AND uname = '\(User.uname!)';"))
        {
            print("删除数据成功")
            let a = actioncreater.createAlterController(msg: msg)
            self.present(a, animated: true, completion: nil)
            
            //self.viewDidLoad()
            //self.viewDidAppear(true)
            //self.view.superview?.inputViewController?.viewDidLoad()
            //self.view.layoutIfNeeded()
            //self.view.superview?.layoutIfNeeded()
            //终于找到了实时刷新页面的方法……
            //let indexPath = indexPathForPreferredFocusedView(in: self.view as! UITableView)
            //var ipa:[IndexPath] = [indexPath!]
            //self.tableView.performBatchUpdates({ self.tableView.deleteRows(at: ipa, with: .none)}, completion: {(isfinish) in self.tableView.reloadData()})
            //还是无法解决
            //解决了，搞了半天是没有重载cell的行数，晕了，不懂方法自动调用的生命周期写个锤子
            self.reload()
           
            /*
            let count = self.tableView.visibleCells.count
            var j:Int?
            for i in 0...count
            {
                let cell = self.tableView.visibleCells[i]
                let btn = cell.viewWithTag(103) as! UIButton
                if(btn.subtitleLabel?.text == bid)
                {
                    j=i
                }
            }
            let cell = self.tableView.visibleCells[j!]
            let img = cell.viewWithTag(104) as! UIImageView
            //img.image = sourse![indexPath.row].Img
            img.image = nil
           
            
            let bname = cell.viewWithTag(101) as! UILabel
            bname.text = nil
            
            let price = cell.viewWithTag(102) as! UILabel
            price.text = nil
            
           
             */
            
        }
        else
        {
            print("删除数据失败")
        }
    }
    
    func reload()
    {
        //红点有一点小小的问题，通过navigation的back返回主界面的时候无法直接更新红点上的数据……
        //目前已知能够改变红点信息的方法
        //1.购物车中删除
        //2.详细信息中添加
        //3.支付（未完成）
        if(source!.count > 0)
        {
            self.tabBarItem.badgeValue = "\(source!.count)"
        }
        else
        {
            self.tabBarItem.badgeValue = nil

        }
        
        //按完按钮重新生成的时间戳订单号是一样的 我也不知道为啥
        //蠢死了。。。在类创建的时候生成date类的对象当然不会影响时间戳。。。。。
        /*
        let timeInterval: TimeInterval = date.timeIntervalSince1970
        print(timeInterval)
        let timeStamp = CLongLong(round(timeInterval*1000))
        let tsNSnumber = timeStamp as NSNumber
        hid = tsNSnumber.stringValue
         */
        
        self.tableView.reloadData()
    }
    
   
    @IBAction func pressApplyBtn(_ sender: Any) {
        //操作历史记录库代码
        
        //获取订单号
        let date = NSDate()
        let timeInterval: TimeInterval = date.timeIntervalSince1970
        //print(timeInterval)
        let timeStamp = CLongLong(round(timeInterval*1000))
        let tsNSnumber = timeStamp as NSNumber
        let hid = tsNSnumber.stringValue
       
        //获取购物车总价
        let result2 = sqt.executeSELECTreturnArray(sql: "SELECT price FROM shop WHERE uname = '\(User.uname!)'")
        var total:Float = 0.00
        if(result2.isFinish)
        {
            let count = result2.StrArray?.count
            for i in 0..<count!
            {
                let numberFormatter = NumberFormatter()
                let number = numberFormatter.number(from: result2.StrArray![i])
                let floatNumber = number?.floatValue
                total += floatNumber!
            }
        }
        else
        {
            print("支付失败")
            return
        }
        let totalprice = String(format: "%.2f", arguments: [total])
        
        
        //获取当前时间
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        let timezone = TimeZone.init(identifier: "Asia/Beijing")
        formatter.timeZone = timezone
        let time = formatter.string(from: Date.init())
        
        //获取该订单的所有书名,并存至历史订单详表
        let result3 = sqt.executeSELECTreturnArray(sql: "SELECT bname FROM shop WHERE uname = '\(User.uname!)'")
        var bnum:String?
        if(result3.isFinish)
        {
            let count = result3.StrArray?.count
            let countNSnumber = count! as NSNumber
            bnum = countNSnumber.stringValue
            print(count!)
            for i in 0..<count!
            {
                let bname = result3.StrArray![i]
                if(sqt.execute(sql: "INSERT INTO historyBook(hid,bname) VALUES('\(hid)','\(bname)')"))
                {
                    print("插入成功")
                }
                else
                {
                    print("支付失败")
                    return
                }
            }
        }
        else
        {
            print("支付失败")
            return
        }
        
        //插入订单记录
        if(sqt.execute(sql: "INSERT INTO history(hid,bnum,uname,totalprice,time) VALUES('\(hid)','\(bnum!)','\(User.uname!)','\(totalprice)','\(time)')"))
        {
            print("插入成功")
        }
        else
        {
            print("支付失败")
            return
        }
        
        
        //删除购物车中所有记录
        let msg = "支付成功"
        if(sqt.execute(sql: "DELETE FROM shop WHERE uname = '\(User.uname!)';"))
        {
            print("删除数据成功")
            //显示警告
            let a = actioncreater.createAlterController(msg: msg)
            self.present(a, animated: true, completion: nil)
            
        //更新界面
        self.reload()
        }
        else
        {
            print("删除数据失败")
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            self.tableView.performBatchUpdates({ self.tableView.deleteRows(at: [indexPath], with: .none)}, completion: {(isfinish) in self.tableView.reloadData()})
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
     */

    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
