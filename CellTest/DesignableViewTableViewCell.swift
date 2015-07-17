//
//  DesignableViewTableViewCell.swift
//  CellTest
//
//  Created by Van on 17/7/15.
//  Copyright (c) 2015 Vanport. All rights reserved.
//

import UIKit

@IBDesignable class DesignableViewTableViewCell: UITableViewCell
{
    @IBOutlet weak var xibView: DesignableView!
    
    override var bounds : CGRect{
        didSet {
            self.contentView.frame = self.bounds;
        }
    }
    
    override func layoutSubviews() {
        
        self.xibView.label.preferredMaxLayoutWidth = CGRectGetWidth(self.xibView.label.frame);
        super.layoutSubviews()
        self.contentView.updateConstraintsIfNeeded();
        self.contentView.layoutIfNeeded();
        
        NSLog("%@", NSStringFromCGRect(self.contentView.frame))
        
    }
}
