//
//  TabBarController.swift
//  iBook
//
//  Created by benzoin_testtube on 2022/5/30.
//

import UIKit

class TabBarController: UITabBarController {

    var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(uname ?? "nil")
        
        //传参
        let vc0 = self.viewControllers![0] as! SortViewController
        vc0.user = user
        let vc1 = self.viewControllers![1] as! ShoppingCartTableViewController
        vc1.user = user
        let vc2 = self.viewControllers![2] as! HistoryViewController
        vc2.user = user
        
        //显示红点
        vc1.viewDidLoad()

        

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

    }
    */

}
