//
//  Youtube.swift
//  OS Z
//
//  Created by 김준우 on 2015. 6. 19..
//  Copyright (c) 2015년 김준우. All rights reserved.
//

import UIKit
import WebKit

class beats1: UIViewController {
    @IBOutlet var youtubemain: UIWebView!
    @IBOutlet var activity: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let url = URL(string: "http://itunes.apple.com/ca/station/")
        let request = URLRequest(url: url!)
        youtubemain.loadRequest(request)
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.default, animated: true)
        
        
        

        
    }
    func webViewDidStartLoad (_ : UIWebView) {
        activity.startAnimating()
        NSLog("The webview start load")
    }
    func webViewDidFinishLoad(_ :UIWebView) {
        activity.stopAnimating()
        NSLog("Webview finished")
    }
}
