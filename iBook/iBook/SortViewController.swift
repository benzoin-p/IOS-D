//
//  SortViewController.swift
//  iBook
//
//  Created by benzoin_testtube on 2022/5/29.
//

import UIKit

class SortViewController: UIViewController {
    
    //var unameA:String?
    var user:User?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(unameA ?? "nil")

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        //传值
        let vc = segue.destination as! TableViewController
        if(segue.identifier == "Sort1")
        {
            vc.sort = 1
        }
        else if(segue.identifier == "Sort2")
        {
            vc.sort = 2
        }
        else if(segue.identifier == "Sort3")
        {
            vc.sort = 3
        }
        vc.user = user
    }


}
