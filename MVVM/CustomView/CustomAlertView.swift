//
//  CustomAlertView.swift
//  WebViewiOSDemo
//
//  Created by mobileteam on 2/18/20.
//  Copyright © 2020 mobileteam. All rights reserved.
//

import Foundation
import UIKit
class CustomAlertView:  UIViewController{
    
    var mainView : UIView = {
        let mainView = UIView()
        mainView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return mainView
    }()
    
    let widthMain = UIScreen.main.bounds.width
    let heightMain = UIScreen.main.bounds.height
    
    override func loadView() {
        view = mainView
        mainView.snp.makeConstraints { (make) in
            make.width.equalTo(widthMain - 20)
            make.height.equalTo(heightMain / 2)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
}
