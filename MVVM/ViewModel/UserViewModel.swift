//
//  UserViewModel.swift
//  MVVM
//
//  Created by mobileteam on 2/18/20.
//  Copyright © 2020 mobileteam. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class UserViewModel: NSObject {
    var searchInput = BehaviorRelay<String?>(value: "")
    var searchResult = BehaviorRelay<[UserModel]>(value: [])
    let disposeBag = DisposeBag()
    
    override init() {
        super.init()
        bindingData()
    }
    
    func bindingData(){
        self.searchInput.asObservable().subscribe(onNext: { (text) in
            if text!.isEmpty{
                self.searchResult.accept([])
            }else{
                
                self.requestJson(url: "https://api.github.com/search/users?q=\(text!)")
            }
        }, onError: { (err) in
            
        }, onCompleted: {
            
        }) {
            
        }.disposed(by: disposeBag)
    }
    
    func requestJson(url : String){
        let url = URL(string : url)
        let session = URLSession.shared
        guard let URL = url else {return}
        session.dataTask(with: URL) { (data, res , err) in
            print("RESS: \(res) error: \(err)")
            
            if err == nil {
                do {
                    if let result : Dictionary<String, Any> = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? Dictionary<String, Any> {
                        var userArray : Array<UserModel> = []
                        if let items:Array<Any> = result["items"] as? Array<Any> {
                            for i in items{
                                let user = UserModel(object: i)
                                userArray.append(user)
                            }
                            self.searchResult.accept(userArray)
                        }
                    }
                } catch {}
            }else{
                
            }
        }.resume()
    }
}
