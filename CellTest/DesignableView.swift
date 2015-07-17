//
//  DesignableView.swift
//  CellTest
//
//  Created by Van on 17/7/15.
//  Copyright (c) 2015 Vanport. All rights reserved.
//

import UIKit

@IBDesignable class DesignableView: DesignableXIBView
{
    override func prepare()
    {
        xib = "DesignableView";
    }
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var lview1: UIView!
    @IBOutlet weak var label: UILabel!
    
    @IBInspectable var text: NSString!
    {
        get {return label.text}
        set(text) {label.text = text}
    }
}