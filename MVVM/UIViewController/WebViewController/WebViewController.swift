//
//  WebViewController.swift
//  WebViewiOSDemo
//
//  Created by mobileteam on 11/14/19.
//  Copyright © 2019 mobileteam. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
      
        let url = URL(string: "https://news.sky.com/world")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
               
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
