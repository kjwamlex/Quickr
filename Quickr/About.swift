//
//  About.swift
//  OS Z
//
//  Created by 김준우 on 2015. 6. 24..
//  Copyright (c) 2015년 김준우. All rights reserved.
//

import UIKit
import MessageUI
class about: UIViewController, MFMailComposeViewControllerDelegate{
    
    
        
        @IBAction func didPresssendemail(_ sender: UIButton!) {
            
            
            if (MFMailComposeViewController.canSendMail()) {
                
                let emailTitle = ""
                
                let messageBody = "Sent from OS Z"
                
                
                
                let mc: MFMailComposeViewController = MFMailComposeViewController()
                
                mc.mailComposeDelegate = self
                
                mc.setSubject(emailTitle)
                
                mc.setMessageBody(messageBody, isHTML: false)
                
                
                
                self.present(mc, animated: true, completion: nil)
                
            }else {
                
                self.showAlertController("No email account is found.")
                
            }
        }
    func mailComposeController(_ controller:MFMailComposeViewController, didFinishWith result:MFMailComposeResult, error:Error?) {
        
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("Mail cancelled")
        case MFMailComposeResult.saved.rawValue:
            print("Mail saved")
        case MFMailComposeResult.sent.rawValue:
            print("Mail sent")
        case MFMailComposeResult.failed.rawValue:
            print("Mail sent failure: \(error!.localizedDescription)")
        default:
            break
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func showAlertController(_ message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
        
        
        
    }
    
}
