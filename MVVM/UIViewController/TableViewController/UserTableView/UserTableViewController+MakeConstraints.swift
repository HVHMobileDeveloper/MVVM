//
//  UserTableViewController+MakeConstraints.swift
//  MVVM
//
//  Created by mobileteam on 2/19/20.
//  Copyright © 2020 mobileteam. All rights reserved.
//

import Foundation
import UIKit

extension UserTableViewController {
    
    internal func setUpUserTableView(){
        mainView = UIView()
        tableView = UITableView()
        tableView.register(UserCell.self, forCellReuseIdentifier: "Cell")
        
        mainForm = UIStackView()
        
        mainForm.axis = .vertical
        mainForm.alignment = .fill
        
        view = mainView
        
        mainView.addSubview(mainForm)
        
        mainForm.snp.makeConstraints { (make) in
            make.width.height.equalTo(mainView)
            make.left.right.top.bottom.equalTo(mainView)
        }
        
        mainForm.addArrangedSubview(tf)
        tf.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.width.equalTo(widthMain - 25)
            make.top.equalTo(10)
        }
        
        mainForm.setCustomSpacing(10, after: self.tf)
        mainForm.addArrangedSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.height.equalTo(heightMain / 2 - 100)
            make.width.equalTo(tf.snp.width)
        }
        
    }

}
