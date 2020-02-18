//
//  UserTableViewController.swift
//  MVVM
//
//  Created by mobileteam on 2/18/20.
//  Copyright © 2020 mobileteam. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class UserTableViewController: UIViewController {
    
    var tableView : UITableView!
    
    var mainView : UIView!
    var mainForm : UIStackView!
    let widthMain = UIScreen.main.bounds.width
    let heightMain = UIScreen.main.bounds.height
    let disposeBag = DisposeBag()

    var tf : MUITextField = {
        let tf = MUITextField(hint: "Enter your keyword", isSecure: false, isClearCTA: true)
        return tf
    }()
    
    var userModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
        self.handleFillData()
    }
    
    fileprivate func handleFillData() {
        self.tf.tf.rx.text.throttle(1, scheduler: MainScheduler.instance).asObservable().bind(to: self.userModel.searchInput).disposed(by: disposeBag)
        
        self.userModel.searchResult.asObservable().bind(to: self.tableView.rx.items(cellIdentifier: "Cell", cellType: UserCell.self)){
            (index, user, cell) in
            cell.label.text = user.userName
        }.disposed(by: disposeBag)
        
    }
    
    fileprivate func setUp(){
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
}
