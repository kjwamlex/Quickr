//
//  Youtube.swift
//  OS Z
//
//  Created by 김준우 on 2015. 6. 19..
//  Copyright (c) 2015년 김준우. All rights reserved.
//

import UIKit
import WebKit

class youtube: UIViewController {
    @IBOutlet var youtubemain: UIWebView!
    @IBOutlet var activity: UIActivityIndicatorView!
    
    @IBOutlet var arrow: UIImageView!
    
    var screenEdgeRecognizer: UIScreenEdgePanGestureRecognizer!

    
    var goforwardgest: UIScreenEdgePanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://www.youtube.com/")
        let request = URLRequest(url: url!)
        youtubemain.loadRequest(request)
        
        navigationController?.navigationBar.barTintColor = UIColor.red
        
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)

        
        
        self.view.backgroundColor = UIColor.groupTableViewBackground
        
            UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        screenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self,
            action: #selector(youtube.gobackgest(_:)))
        screenEdgeRecognizer.edges = .left
        view.addGestureRecognizer(screenEdgeRecognizer)
        
        goforwardgest = UIScreenEdgePanGestureRecognizer(target: self,
            action: #selector(youtube.goforwardgest(_:)))
        goforwardgest.edges = .right
        view.addGestureRecognizer(goforwardgest)
        
}
    
    

    
    func gobackgest(_ sender: UIScreenEdgePanGestureRecognizer) {
        
        self.arrow.image = UIImage(named:"_318-36959.png")

        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.youtubemain.alpha = 0
        })
        
        UIView.animate(withDuration: 0.5, animations: {
            
            if sender.state == .ended {
                
                self.youtubemain.alpha = 1
                self.youtubemain.goBack()
            }

        })
    }
    
    
    func goforwardgest(_ sender: UIScreenEdgePanGestureRecognizer) {
        
        self.arrow.image = UIImage(named:"_318-369opposite59.png")

        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.youtubemain.alpha = 0
        })
        
        UIView.animate(withDuration: 0.5, animations: {
            
            if sender.state == .ended {
                
                self.youtubemain.alpha = 1
                self.youtubemain.goForward()
            }
            
        })
    }

    
    
    @IBAction func goBack(_ sender: AnyObject) {
        youtubemain.goBack()
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
