//
//  FaceBook.swift
//  OS Z
//
//  Created by 김준우 on 2015. 6. 27..
//  Copyright (c) 2015년 김준우. All rights reserved.
//

import UIKit
import Social

class facebook: UIViewController {
    
    @IBOutlet var text: UITextField!
    
    @IBOutlet var webView: UIWebView!
    
    var screenEdgeRecognizer: UIScreenEdgePanGestureRecognizer!
    
    
    var goforwardgest: UIScreenEdgePanGestureRecognizer!
    
    @IBOutlet var imageArrowView : UIImageView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://www.facebook.com/")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        
       self.view.backgroundColor = UIColor.groupTableViewBackground
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 59/255.0, green:89/255.0, blue:152/255.0, alpha:1.0)
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)
       
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        screenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self,
            action: #selector(facebook.gobackgest(_:)))
        screenEdgeRecognizer.edges = .left
        view.addGestureRecognizer(screenEdgeRecognizer)
        
        
        goforwardgest = UIScreenEdgePanGestureRecognizer(target: self,
            action: #selector(facebook.goForwards(_:)))
        goforwardgest.edges = .right
        view.addGestureRecognizer(goforwardgest)


    }
    
    @IBAction func postToFacebook(_ sender: UIButton) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
            let controller = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
            controller?.setInitialText(text.text)
            self.present(controller!, animated:true, completion:nil)
        }
            
        else {
self.showAlertController("You don't have Facebook account")
        }
    

    
}
    
    func gobackgest(_ sender: UIScreenEdgePanGestureRecognizer) {
        
        self.imageArrowView.image = UIImage(named:"_318-36959.png")
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.webView.alpha = 0
        })
        
        UIView.animate(withDuration: 0.5, animations: {
            
            
            
            if sender.state == .ended {
                
                self.webView.alpha = 1
                self.webView.goBack()
            }
            
        })
    }
    
    func goForwards(_ sender: UIScreenEdgePanGestureRecognizer) {
        
        self.imageArrowView.image = UIImage(named:"_318-369opposite59.png")
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.webView.alpha = 0
        })
        
        UIView.animate(withDuration: 0.5, animations: {
            
            
            
            if sender.state == .ended {
                
                self.webView.alpha = 1
                self.webView.goForward()
            }
            
        })
        
    }

    
    func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    func showAlertController(_ message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

}
