//
//  AlertMV.swift
//  WebViewiOSDemo
//
//  Created by mobileteam on 2/18/20.
//  Copyright © 2020 mobileteam. All rights reserved.
//

import Foundation
import UIKit

protocol AlertActionDelegate {
    func action() -> ()
}

class AlertMV : NSObject {
    
    var delegateAction : AlertActionDelegate!
    
    open func alerSetup(layout: UIViewController, context : UIViewController) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
               
        // Create custom content viewController
        let contentViewController = layout
        contentViewController.preferredContentSize = contentViewController.view.bounds.size
        alertController.setValue(contentViewController, forKey: "contentViewController")
        context.present(alertController, animated: true, completion: nil)
    }
    

    open func alerSetup(titleCTA : String, isCancelAppear : Bool, layout: UIViewController, context : UIViewController) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: titleCTA, style: .default) { (action) in
            if self.delegateAction != nil{
                self.delegateAction.action()
            }
        }
        if isCancelAppear {
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        }
        alertController.addAction(okAction)
        
        // Create custom content viewController
        let contentViewController = layout
        contentViewController.preferredContentSize = contentViewController.view.bounds.size
        alertController.setValue(contentViewController, forKey: "contentViewController")
        context.present(alertController, animated: true, completion: nil)
    }

}
