//
//  CurrentOrderViewController.swift
//  Money2020
//
//  Created by Suchit Panjiyar on 10/24/15.
//  Copyright © 2015 Hack. All rights reserved.
//

import UIKit
import Parse
import Bolts

class CurrentOrderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var a = [ "New Orders", "In progress" ]
    var itemsInNew = ["a","b"]
    var itemsInProgress = ["c","d","e"]
    
    
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
        var breakpoint : Int = indexPath.row
        var  counter = 0
        var query = PFQuery(className: "VendorDatabase")
        query.findObjectsInBackgroundWithBlock{ (objects: [PFObject]?, error: NSError?) -> Void in
            if error != nil
            {
                print(error)
            }
            if objects != nil
            {
                let objects = objects
                for eachObject in objects!
                {
                    if eachObject["IDNumber"] as! Int == 1
                    {
                        if (counter == indexPath.row)
                        {
                        eachObject.incrementKey("IDNumber")
                        eachObject.saveInBackgroundWithBlock{ (success: Bool, error : NSError?) -> Void in }
                        }
                        counter++
                    }
                }
            }
        }
        self.runQuery()

    }

    

    @IBOutlet weak var tableView: UITableView!

    func runQuery()
    {
        
        OrderNumber.removeAll()
        quantity.removeAll()
        name.removeAll()
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
                    for eachObject in objects!
                    {
                        if (eachObject["IDNumber"] as! Int) == 1
                        {
                            self.OrderNumber.append(eachObject["OrderNumber"] as! Int)
                            self.quantity.append(eachObject["Quantity"] as! Int)
                            self.name.append(eachObject["Name"] as! String)
                        }
                    }
                    self.tableView.reloadData()

                }
            }
        }
        
    }
    
    @IBAction func refresh() {
        self.runQuery()
    }
    
    
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        var PickupVC = segue.destinationViewController as! PickupViewController
//        if let indexPath = self.tableView.indexPathForSelectedRow
//        {
//            PickupVC.itemsToBePickedUp.append("sjbdfhhbjn")
//        }
//    
//    }



}

