//
//  MainViewController.swift
//  WebViewiOSDemo
//
//  Created by mobileteam on 2/18/20.
//  Copyright © 2020 mobileteam. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import IHKeyboardAvoiding
import RxSwift
import RxCocoa

class MainViewController : UIViewController {
    
    
    let UIMainScroll : UIScrollView = {
        let main = UIScrollView()
        main.backgroundColor = UIColor.White()
        return main
    }()
    
    let UIMain : UIView = {
        let main = UIView()
        main.backgroundColor = UIColor.White()
        return main
    }()
    
    let stackForm : UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .vertical
        return stack
    }()
    
    let widthMain = UIScreen.main.bounds.width
    let heightMain = UIScreen.main.bounds.height
    
    var userName : MUITextField!
    var passWord : MUITextField!
    
    //Deprecated var authenticationMV = AuthenticationVM()
    var loginVM = LoginViewModel()
    var alertPoup = AlertMV()
    var actionSheet = BottomSheetMV()
    let disposeBag = DisposeBag()
    
    var submit : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.White()
        initializeView()
        onSetupTextField()
        onObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
    }
    
    fileprivate func onSetupTextField(){
        userName.tf.delegate = self
        userName.tf.returnKeyType = .next
        
        passWord.tf.delegate = self
        passWord.tf.returnKeyType = .done
    }
    
    fileprivate func onObserver(){
        _ = userName.tf.rx.text.map{ $0 ?? ""}.bind(to: loginVM.email)
        _ = passWord.tf.rx.text.map{ $0 ?? ""}.bind(to: loginVM.password)
        
        loginVM.validMessage.subscribe(onNext: { [unowned self] (message) in
            self.submit.setTitle(message, for: .normal)
        }, onError: { (err) in
            
        }, onCompleted: {
            
        }) {
            
        }.disposed(by: disposeBag )
    }
    
    @objc func onSubmitTapped() {
       
    }
  
    func showAlertView() {
        let contentViewController = CustomAlertView()
        alertPoup.alerSetup(layout: contentViewController, context: self)
    }
    
    func showActionSheet(){
        let contentViewController = UserTableViewController()
        actionSheet.actionSheetSetup(titleCTA: "Close", layout: contentViewController, context: self)
    }
    
    
}

extension MainViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == userName.tf {
            passWord.tf.becomeFirstResponder()
        }
        else if textField == passWord.tf{
            passWord.tf.resignFirstResponder()
        }
        return false
    }
}

