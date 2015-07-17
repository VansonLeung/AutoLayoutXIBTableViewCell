//
//  ViewController.swift
//  CellTest
//
//  Created by Van on 17/7/15.
//  Copyright (c) 2015 Vanport. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dview : DesignableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        DELAY(2.0) { self.dview.text = "ABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \n" }
        DELAY(4.0) { self.dview.text = "ABC ABC \nABC ABC " }
        DELAY(6.0) { self.dview.text = "ABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \nABC ABC \n" }
        DELAY(8.0) { self.showDetails() }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    func showDetails()
    {
        let vc = self.storyboard!
            .instantiateViewControllerWithIdentifier("ListViewController")
            as ListViewController
        self.presentViewController(vc, animated: true) { () -> Void in
            NSLog("asdfadsf");
        }
        
    }
}

