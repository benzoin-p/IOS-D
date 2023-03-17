//
//  TableViewController.swift
//  iBook
//
//  Created by benzoin_testtube on 2022/5/29.
//
//  用于分类中的图书展示页
//  打开第一个分类不知为何速度较慢，打开第一个分类中第一本书的详细页面不知为何速度很慢

import UIKit

class TableViewController: UITableViewController {
    
    var source:[Book]?
    
    var sort:Int = 0
    
    let sqt = SqliteTool()
    
    //var unameA2:String?
    var user:User?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(unameA2 ?? "nil")
        
        source = []
        if(sort == 1)
        {
            let result = sqt.executeSELECTreturnArray(sql: "SELECT bid FROM book WHERE type = '工具应用';")
            
            if(result.isFinish)
            {
                let count = result.StrArray?.count
                for i in 0..<count!
                {
                    let bid = result.StrArray![i]
                    source?.append(Book(bid: bid))
                }
            }
        }
        else if(sort == 2)
        {
            let result = sqt.executeSELECTreturnArray(sql: "SELECT bid FROM book WHERE type = '教材教辅';")
            
            if(result.isFinish)
            {
                let count = result.StrArray?.count
                for i in 0..<count!
                {
                    let bid = result.StrArray![i]
                    source?.append(Book(bid: bid))
                }
            }
        }
        else if(sort == 3)
        {
            let result = sqt.executeSELECTreturnArray(sql: "SELECT bid FROM book WHERE type = '文学作品';")
            
            if(result.isFinish)
            {
                let count = result.StrArray?.count
                for i in 0..<count!
                {
                    let bid = result.StrArray![i]
                    source?.append(Book(bid: bid))
                }
            }
        }
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return source!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
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

        // Configure the cell...

        return cell
    }
    
    //重设行高
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
            tableView.deleteRows(at: [indexPath], with: .fade)
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailsViewController
        let btn = sender as! UIButton
        vc.bid = (btn.subtitleLabel?.text)!
        vc.user = user
    }
    

}
