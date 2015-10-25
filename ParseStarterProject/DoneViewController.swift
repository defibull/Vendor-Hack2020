//
//  DoneViewController.swift
//  Money2020
//
//  Created by Suchit Panjiyar on 10/24/15.
//  Copyright © 2015 Hack. All rights reserved.
//

import UIKit
import Parse
class DoneViewController: UIViewController {

    
    var Completed = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.queryForCreditCard()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Completed.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: CurrentOrderTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as! CurrentOrderTableViewCell
        return cell
    }
    
    func queryForCreditCard(){
        var query = PFQuery(className:"_User")
        query.getObjectInBackgroundWithId("yBpQuEHgKv") {
            (tempObject: PFObject?, error: NSError?) -> Void in
            if error == nil && tempObject != nil {
                let temp = tempObject?.objectForKey("creditCard") as! Int
                print(temp)
            } else {
                print(error)
            }
        }
    }

    @IBOutlet weak var tableView: UITableView!

}
