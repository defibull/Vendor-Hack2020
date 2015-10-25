//
//  NewOrdersViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Avirudh Theraja on 10/25/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class NewOrdersViewController: UIViewController {
    var OrderNumber: [Int] = []
    var quantity: [Int] = []
    var name: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CurrentOrderTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        self.runQuery()
        //self.tableView!.registerClass(CurrentOrderTableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OrderNumber.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: CurrentOrderTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as! CurrentOrderTableViewCell;
        cell.name.text = name[indexPath.row]
        cell.quantity.text = String(quantity[indexPath.row])
        cell.orderNumber.text = String(OrderNumber[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    func runQuery()
    {
        var query = PFQuery(className: "VendorDatabase")
        query.findObjectsInBackgroundWithBlock{ (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil
            {
                if objects == nil
                {
                    print("Bhenchod")
                }
                else
                {
                    print ("bc")
                    for eachObject in objects!
                    {
                        if (eachObject["IDNumber"] as! Int) == 0
                        {
                            self.OrderNumber.append(eachObject["OrderNumber"] as! Int)
                            self.quantity.append(eachObject["Quantity"] as! Int)
                            self.name.append(eachObject["Name"] as! String)
                        }
                        self.tableView.reloadData()
                    }
                }
            }
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
