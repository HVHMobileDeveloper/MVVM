//
//  BottomSheetMV.swift
//  WebViewiOSDemo
//
//  Created by mobileteam on 2/18/20.
//  Copyright © 2020 mobileteam. All rights reserved.
//
import Foundation
import UIKit

protocol ActionSheetDelegate {
    func action() -> ()
}

class BottomSheetMV : NSObject {
    
    var delegateActionSheet : ActionSheetDelegate!
    
    open func actionSheetSetup(titleCTA : String ,layout: UIViewController, context : UIViewController) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: titleCTA, style: .default) { (action) in
            if self.delegateActionSheet != nil{
                self.delegateActionSheet.action()
            }
        }
        alertController.addAction(okAction)
        
        // Create custom content viewController
        let contentViewController = layout
        contentViewController.preferredContentSize = contentViewController.view.bounds.size
        alertController.setValue(contentViewController, forKey: "contentViewController")
        context.present(alertController, animated: true, completion: nil)
    }
    
    
    open func actionSheetSetup(layout: UIViewController, context : UIViewController) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // Create custom content viewController
        let contentViewController = layout
        contentViewController.preferredContentSize = contentViewController.view.bounds.size
        alertController.setValue(contentViewController, forKey: "contentViewController")
        context.present(alertController, animated: true, completion: nil)
    }
    
}
