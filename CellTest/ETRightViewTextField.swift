//
//  ETRightViewTextField.swift
//  CellTest
//
//  Created by Van on 17/7/15.
//  Copyright (c) 2015 Vanport. All rights reserved.
//

import UIKit

@IBDesignable class ETRightViewTextField: UITextField,UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    let rightViewLabel:UILabel = UILabel(frame: CGRectMake(0, 0, 10, 10))
    let datePicker:UIPickerView = UIPickerView()
    var years = [String]()
    // MARK: Inspectable properties ******************************
    
    @IBInspectable var rightViewText: String = "" {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var rightViewTextColor: UIColor = UIColor.lightTextColor() {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var isPickerInput : Bool = false {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var pickerData : String = "" {
        didSet{
            setupData()
        }
    }
    // MARK: Overrides ******************************************
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    override func rightViewRectForBounds(bounds: CGRect) -> CGRect {
        if self.text == "" {
            return CGRectMake(self.frame.size.width/2, 0, self.frame.size.width/2,self.frame.size.height)
        }else {
            return CGRectZero
        }
    }
    // MARK: PickerView  ******************
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return years.count;
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return "\(years[row])"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = "\(years[row])"
    }
    
    
    // MARK: Internal functions *********************************
    
    private func setupView() {
        if self.isPickerInput == true {
            years.append("HEllo")
            self.inputView = datePicker
            self.datePicker.delegate = self
            self.datePicker.dataSource = self
            self.datePicker.reloadAllComponents()
        }
        if self.text == "" {
            rightViewLabel.text = rightViewText
        }
        self.rightViewLabel.textColor = rightViewTextColor
        self.rightView = rightViewLabel
        self.rightViewMode = UITextFieldViewMode.UnlessEditing
        //        self.setNeedsDisplay();
    }
    private func setupData() {
        if pickerData != "" {
            years = split(pickerData) {$0 == ","}
            self.datePicker.reloadAllComponents()
        }
    }
}