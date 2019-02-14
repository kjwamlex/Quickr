//
//  WebBrowser.swift
//  OS Z
//
//  Created by 김준우 on 2015. 6. 2..
//  Copyright (c) 2015년 김준우. All rights reserved.
//

import UIKit

class phone : UIViewController, UITextFieldDelegate {
    
    @IBOutlet var webView: UIWebView!
    @IBOutlet var phonenumber: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        phonenumber.becomeFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()        
        phonenumber.delegate = self
        webView.backgroundColor = UIColor.black
        self.view.backgroundColor = UIColor.black
        
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.black]


    }
    
 



    
    @IBAction func call(_ sender:AnyObject) {
        
        let text = phonenumber.text
        //let url = NSURL(string: text!)
        //let request = NSURLRequest(URL: url!)
        //webView.loadRequest(request)
        
        if text!.hasPrefix("tel:") {
            let url = URL(string: text!)
            let request = URLRequest(url: url!)
            webView.loadRequest(request)

        }else {
            let phoneNumber = text
            var text = phonenumber.text
            text = "tel:" + phoneNumber!
            let url = URL(string: text!)
            let request = URLRequest(url: url!)
            webView.loadRequest(request)
            
        }
        
        
        
    }
    func textFieldShouldReturn(_ text: UITextField) -> Bool{
        text.resignFirstResponder()
        return true;
    }




    
}



