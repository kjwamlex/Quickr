//
//  Messages.swift
//  OS Z
//
//  Created by 김준우 on 2015. 6. 10..
//  Copyright (c) 2015년 김준우. All rights reserved.
//

import UIKit
import MessageUI

class messages: UIViewController,MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result.rawValue) {
        case MessageComposeResult.cancelled.rawValue:
            
            self.dismiss(animated: false, completion: nil)
        case MessageComposeResult.failed.rawValue:
            print("Message failed")
            self.dismiss(animated: true, completion: nil)
        case MessageComposeResult.sent.rawValue:
            
            self.dismiss(animated: true, completion: nil)
            
        default:
            break;
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.black]

        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)
        
        let messageVC = MFMessageComposeViewController()
        messageVC.messageComposeDelegate = self;
        
        self.present(messageVC, animated: true, completion: nil)

    
    }
    
    func showAlertController(_ message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

    
    }



