//
//  MUITextField.swift
//  WebViewiOSDemo
//
//  Created by mobileteam on 2/18/20.
//  Copyright © 2020 mobileteam. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class MUITextField: UIView {
    
    var tf = UITextField()
    
    private var holder = ""
    private var isSecureTextEntry = false
    private var isClearCTA = false
    
    open func getText() -> String {
        return tf.text ?? ""
    }
    
    override init (frame : CGRect) {
        super.init(frame : frame)
    }
    
    convenience init (hint : String, isSecure : Bool, isClearCTA : Bool) {
        self.init(frame:CGRect.zero)
        
        self.holder = hint
        self.isSecureTextEntry = isSecure
        self.isClearCTA = isClearCTA
        
        onSetUp()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    private func onSetUp() -> () {
        self.backgroundColor = UIColor.textFieldColor()
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.textFieldBorderColor().cgColor
        self.layer.borderWidth = 1
        
        
        tf.placeholder = holder
        tf.isSecureTextEntry = isSecureTextEntry
        if isClearCTA {
            tf.clearButtonMode = UITextField.ViewMode.whileEditing
        }
        
        self.addSubview(tf)
        tf.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
    
}
