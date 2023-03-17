//
//  HistoryBookViewController.swift
//  iBook
//
//  Created by benzoin_testtube on 2022/6/3.
//

import UIKit

class HistoryBookViewController: UITableViewController {

    let sqt = SqliteTool()
    
    var source:[HistoryBook]?
    
    var hid:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        source = []
        let result = sqt.executeSELECTreturnArray(sql: "SELECT bname FROM historyBook WHERE hid = '\(hid!)'")
        if(result.isFinish)
        {
            let count = result.StrArray?.count
            for i in 0..<count!
            {
                let bname = result.StrArray![i]
                source?.append(HistoryBook(hid: hid, bname: bname))
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
        let result = sqt.executeSELECTreturnArray(sql: "SELECT bname FROM historyBook WHERE hid = '\(hid!)'")
        if(result.isFinish)
        {
            let count = result.StrArray?.count
            for i in 0..<count!
            {
                let bname = result.StrArray![i]
                source?.append(HistoryBook(hid: hid, bname: bname))
            }
        }
        return source!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        
        if(indexPath.row<source!.count)
        {
            //print(indexPath.row)
            let bname = cell.viewWithTag(101) as! UILabel
            bname.text = "书名："+source![indexPath.row].bname!
        }
        // Configure the cell...

        return cell
    }
    
    
    func reload()
    {
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
