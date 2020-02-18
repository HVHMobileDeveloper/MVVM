//
//  MainViewController+Constraints.swift
//  WebViewiOSDemo
//
//  Created by mobileteam on 2/18/20.
//  Copyright © 2020 mobileteam. All rights reserved.
//

import Foundation
import IHKeyboardAvoiding
extension MainViewController {
    
    internal func initializeView () {
        userName = MUITextField(hint: "Name", isSecure: false, isClearCTA: true)
        passWord = MUITextField(hint: "Password", isSecure: true, isClearCTA: true)
        KeyboardAvoiding.avoidingView = self.UIMain
        
        makeUIConstaints()
    }
    
    fileprivate func setUpSubmitBtn(){
        submit = UIButton()
        submit.setTitle("Submit", for: .normal)
        submit.layer.borderColor = UIColor.borderCTAColor().cgColor
        submit.layer.borderWidth = 1
        submit.setTitleColor( UIColor.borderCTAColor(), for: .normal)
        submit.layer.cornerRadius = 5
        submit.addTarget(self, action: #selector(onSubmitTapped), for: .touchDown)
    }
    
    fileprivate func makeUIConstaints () {
        view.addSubview(UIMainScroll)

        UIMainScroll.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(heightMain)
            make.width.equalTo(widthMain)
        }
        
        UIMainScroll.addSubview(UIMain)
        UIMain.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(UIMainScroll)
            make.left.right.equalTo(UIMainScroll)
            make.width.equalTo(UIMainScroll)
            make.height.equalTo(UIMainScroll)
        }
        
        //MARK: Frame LoginForm ---------------------------------------
        UIMain.addSubview(stackForm)
        stackForm.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalTo(UIMain).offset(-50)
        }

        stackForm.addArrangedSubview(userName)
        userName.snp.makeConstraints { (make) in
            make.width.equalTo(stackForm)
            make.height.equalTo(40)
        }
        
        stackForm.setCustomSpacing(15, after: userName)
        
        stackForm.addArrangedSubview(passWord)
        passWord.snp.makeConstraints { (make) in
            make.width.equalTo(stackForm)
            make.height.equalTo(userName.snp.height)
        }
        
        stackForm.setCustomSpacing(15, after: passWord)

        self.setUpSubmitBtn()
        stackForm.addArrangedSubview(submit)
        submit.snp.makeConstraints { (make) in
            make.width.equalTo(stackForm)
            make.height.equalTo(passWord.snp.height)
        }
        
        //MARK: Frame LoginForm / ---------------------------------------

        
    }
    
}
