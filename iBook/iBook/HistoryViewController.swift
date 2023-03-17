//
//  HistoryViewController.swift
//  iBook
//
//  Created by benzoin_testtube on 2022/5/31.
//

import UIKit

class HistoryViewController: UITableViewController {
    
    let sqt = SqliteTool()
    
    var source:[History]?
    
    var user:User?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        source = []
        let result = sqt.executeSELECTreturnArray(sql: "SELECT hid FROM history WHERE uname = '\(User.uname!)'")
        
        if(result.isFinish)
        {
            let count = result.StrArray?.count
            for i in 0..<count!
            {
                let hid = result.StrArray![i]
                source?.append(History(hid: hid, uname: User.uname!))
            }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.reload()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        source = []
        let result = sqt.executeSELECTreturnArray(sql: "SELECT hid FROM history WHERE uname = '\(User.uname!)'")
        
        if(result.isFinish)
        {
            let count = result.StrArray?.count
            for i in 0..<count!
            {
                let hid = result.StrArray![i]
                source?.append(History(hid: hid, uname: User.uname!))
            }
        }
        
        
        return source!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if(indexPath.row<source!.count)
        {
            //print(indexPath.row)

           
            
            let hid = cell.viewWithTag(101) as! UILabel
            hid.text = "订单编号："+source![indexPath.row].hid!
            
            let bnum = cell.viewWithTag(102) as! UILabel
            bnum.text = "购买数目："+source![indexPath.row].bnum!
            
            let totalprice = cell.viewWithTag(103) as! UILabel
            totalprice.text = "总价："+source![indexPath.row].totalprice!
            let time = cell.viewWithTag(104) as! UILabel
            time.text = "购买时间："+source![indexPath.row].time!
            
            let button = cell.viewWithTag(105) as! UIButton
            button.subtitleLabel?.text = source![indexPath.row].hid!

        }
        // Configure the cell...

        return cell
    }
    
    func reload()
    {
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    @IBAction func pressBookBtn(_ sender: Any) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vc = segue.destination as! HistoryBookViewController
        let btn = sender as! UIButton
        vc.hid = (btn.subtitleLabel?.text)!
    }
    

}
