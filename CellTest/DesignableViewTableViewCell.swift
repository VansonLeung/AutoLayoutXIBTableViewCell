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
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        self.contentView.updateConstraintsIfNeeded();
        self.contentView.layoutIfNeeded();
        self.xibView.label.preferredMaxLayoutWidth = CGRectGetWidth(self.xibView.label.frame);
        
    }
}
