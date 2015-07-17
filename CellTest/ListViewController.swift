//
//  ListViewController.swift
//  CellTest
//
//  Created by Van on 17/7/15.
//  Copyright (c) 2015 Vanport. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let kCellIdentifier = "CellIdentifier"
    
    var array : NSArray = []
    
    @IBOutlet weak var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "DesignableViewTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: kCellIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        
        DELAY(2.0) {
            self.array = [
                "ABC",
                "DEF"
            ]
            self.tableView.reloadData()
        }
        
        DELAY(4.0) {
            self.array = [
                "GHI",
                "JKL",
                "JKL",
                "1 \n1 \n1 \n1 \n1 \n1 \n1 \n1 \n1 \n1 \n1 \n1 \n1 \n1 \n1 \n1 \n1 \n1 \n1 \n",
                "JKL",
            ]
            self.tableView.reloadData()
        }
        
        DELAY(6.0) {
            self.array = [
                "MNO",
            ]
            self.tableView.reloadData()
        }
        
        DELAY(8.0) {
            self.array = [
                "PQR",
                "ABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \n",
            ]
            self.tableView.reloadData()
        }
    }

    
    
    
    

    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "contentSizeCategoryChanged:", name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }
    
    override func viewDidDisappear(animated: Bool)
    {
        super.viewDidDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }
    
    // This function will be called when the Dynamic Type user setting changes (from the system Settings app)
    func contentSizeCategoryChanged(notification: NSNotification)
    {
        tableView.reloadData()
    }
    
    
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return array.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        // This will be the case for programmatically loaded cells (see viewDidLoad to switch approaches)
        if let cell: DesignableViewTableViewCell =
            tableView.dequeueReusableCellWithIdentifier(kCellIdentifier)
                as? DesignableViewTableViewCell
        {

            cell.xibView.btn1.setTitle("Cell #" + String(indexPath.row), forState: UIControlState.Normal)
            cell.xibView.btn2.setTitle("", forState: UIControlState.Normal)

            cell.xibView.text = array[indexPath.row] as NSString;

            cell.setNeedsUpdateConstraints()
            cell.updateConstraintsIfNeeded()
            
            
            return cell
        }
        
        assert(false, "The dequeued table view cell was of an unknown type!")
        return UITableViewCell()
    }
    
}
