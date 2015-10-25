//
//  CurrentOrderViewController.swift
//  Money2020
//
//  Created by Suchit Panjiyar on 10/24/15.
//  Copyright © 2015 Hack. All rights reserved.
//

import UIKit

class CurrentOrderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var a = [ "New Orders", "In progress" ]
    var itemsInNew = ["a","b"]
    var itemsInProgress = ["c","d","e"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CurrentOrderTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        //self.tableView!.registerClass(CurrentOrderTableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var itemSize = [itemsInNew.count, itemsInProgress.count]
        return itemSize[section]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: CurrentOrderTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as! CurrentOrderTableViewCell;
        cell.namely = "Suchit"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return a[section]
    }

    @IBOutlet weak var tableView: UITableView!

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        var PickupVC = segue.destinationViewController as! PickupViewController
//        if let indexPath = self.tableView.indexPathForSelectedRow
//        {
//            PickupVC.itemsToBePickedUp.append("sjbdfhhbjn")
//        }
//    
//    }



}

