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
        DELAY(6.0) { self.dview.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum." }
        DELAY(10.0) { self.dview.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and END!" }
        DELAY(14.0) { self.showDetails() }
        
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

