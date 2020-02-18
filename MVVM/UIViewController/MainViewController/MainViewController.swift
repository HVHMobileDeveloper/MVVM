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
    
    var authenticationMV = AuthenticationVM()
    var alertPoup = AlertMV()
    var actionSheet = BottomSheetMV()
    
    var submit : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.White()
        initializeView()
        onSetupTextField()
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
    
    @objc func onSubmitTapped() {
        authenticationMV.authenticateUserWith(userName.getText(), andPass: passWord.getText())
        authenticationMV.loginCompletionHandler {[weak self] (isSucess, message) in
            guard let self = self else {return}
            
            self.submit.setTitle(message, for: .normal)
            if !isSucess{
                self.onRedirectSubmitSuccessFul()
            }
        }
    }
    
    fileprivate func onRedirectSubmitSuccessFul(){
        showActionSheet()
    }
    
    func showAlertView() {
        let contentViewController = CustomAlertView()
        alertPoup.alerSetup(layout: contentViewController, context: self)
    }
    
    func showActionSheet(){
        let contentViewController = MaterialBottomSheet()
        actionSheet.actionSheetSetup(layout: contentViewController, context: self)
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

