//
//  WebBrowser.swift
//  OS Z
//
//  Created by 김준우 on 2015. 6. 2..
//  Copyright (c) 2015년 김준우. All rights reserved.
//

import UIKit
import WebKit

class webbrowser : UIViewController, UIWebViewDelegate, UITextFieldDelegate, UIScrollViewDelegate, WKNavigationDelegate {
    
    @IBOutlet var webView: UIWebView!
    @IBOutlet var textfield: UITextField!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var imageArrowView: UIImageView!
    
    var screenEdgeRecognizer: UIScreenEdgePanGestureRecognizer!

    var clostgest: UIRotationGestureRecognizer!
    
    var goforwardgest: UIScreenEdgePanGestureRecognizer!
    
    @IBOutlet var testarrow0: UIButton!
    
    @IBOutlet var testarrow1: UIButton!
    
    @IBOutlet var tabbar: UIToolbar!
    
    @IBOutlet var refreshbutton: UIButton!

    
@IBOutlet var activity: UIActivityIndicatorView!
    
    @IBAction func changestyle( _ sender: UIButton!) {
        
        refreshbutton.setTitle("R", for: UIControlState()) 
    }
    
    @IBAction func toggle(_ sender: AnyObject) {
        navigationController?.setNavigationBarHidden(navigationController?.isNavigationBarHidden == false, animated: true) //or animated: false
        self.navigationController?.setToolbarHidden(true, animated: true)

    }
    
    override func prefersStatusBarHidden() -> Bool {
        return navigationController?.isNavigationBarHidden == true
    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return UIStatusBarAnimation.fade
    }

    
    override func viewWillLayoutSubviews() {
        
        if UIDevice.current.orientation.isLandscape {
            
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: ({
                
                self.testarrow0.isUserInteractionEnabled = true
                self.testarrow1.isUserInteractionEnabled = true
                self.testarrow1.frame.size.width  = 30
                self.testarrow0.frame.size.width = 30
                self.testarrow0.isHidden = false
                self.testarrow1.isHidden = false
                
                self.textfield.frame.size.width = 300

            }), completion: nil)

            
        }
        
        if UIDevice.current.orientation.isPortrait {
            
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: ({
            self.testarrow0.isUserInteractionEnabled = false
            self.testarrow1.isUserInteractionEnabled = false
            self.testarrow1.frame.size.width  = 0
            self.testarrow0.frame.size.width = 0
            self.testarrow0.isHidden = true
            self.testarrow1.isHidden = true
            self.textfield.frame.size.width = 300
    
            }), completion: nil)
        }
        
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        if UIDevice.current.orientation.isLandscape {
            
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: ({
                
                self.testarrow0.isUserInteractionEnabled = true
                self.testarrow1.isUserInteractionEnabled = true
                self.testarrow1.frame.size.width  = 30
                self.testarrow0.frame.size.width = 30
                self.testarrow0.isHidden = false
                self.testarrow1.isHidden = false
                
                self.textfield.frame.size.width = 500
                
            }), completion: nil)
            
            
        }
        
        if UIDevice.current.orientation.isPortrait {
            
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: ({
                self.testarrow0.isUserInteractionEnabled = false
                self.testarrow1.isUserInteractionEnabled = false
                self.testarrow1.frame.size.width  = 0
                self.testarrow0.frame.size.width = 0
                self.testarrow0.isHidden = true
                self.testarrow1.isHidden = true
                self.textfield.frame.size.width = 500
                
            }), completion: nil)
        }

    }
    
    var lastOffsetY :CGFloat = 0

    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView){
       // navigationController?.setNavigationBarHidden(navigationController?.navigationBarHidden == true, animated: true) //or animated: false
       // self.navigationController?.setToolbarHidden(true, animated: true)

        lastOffsetY = scrollView.contentOffset.y
            }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView){
        
        //let hide = scrollView.contentOffset.y > self.lastOffsetY
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
        //tabbar.hidden = false
        
        let hide = scrollView.contentOffset.y > self.lastOffsetY
        self.navigationController?.setNavigationBarHidden(hide, animated: true)
        tabbar.isHidden = hide

    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        //self.navigationController?.setNavigationBarHidden(false, animated: true)

    }
    
    
    
    
    override func viewDidLoad() {
        
        let phonenumber = textfield.text
        
        webView.scrollView.delegate = self
        
        super.viewDidLoad()
        let url = URL(string: "http://www.google.com/")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        textfield.delegate = self
        
        UIApplication.shared.statusBarStyle = .default
        
        screenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self,
            action: #selector(webbrowser.gobackgest(_:)))
        screenEdgeRecognizer.edges = .left
        view.addGestureRecognizer(screenEdgeRecognizer)
        
        goforwardgest = UIScreenEdgePanGestureRecognizer(target: self,
            action: #selector(webbrowser.goForwards(_:)))
     goforwardgest.edges = .right
        view.addGestureRecognizer(goforwardgest)
        
        if UIDevice.current.orientation.isLandscape {
            
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: ({
                
                self.testarrow0.isUserInteractionEnabled = true
                self.testarrow1.isUserInteractionEnabled = true
                self.testarrow1.frame.size.width  = 30
                self.testarrow0.frame.size.width = 30
                self.testarrow0.isHidden = false
                self.testarrow1.isHidden = false
                
                self.textfield.frame.size.width = 500
                
            }), completion: nil)
            
            
        }
        
        if UIDevice.current.orientation.isPortrait {
            
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: ({
                self.testarrow0.isUserInteractionEnabled = false
                self.testarrow1.isUserInteractionEnabled = false
                self.testarrow1.frame.size.width  = 0
                self.testarrow0.frame.size.width = 0
                self.testarrow0.isHidden = true
                self.testarrow1.isHidden = true
                self.textfield.frame.size.width = 500
                
            }), completion: nil)
            
            
            
        }
        textfield.text = "google.com"
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: ({
            self.textfield.textAlignment = .center
            
        }), completion: nil)
        

        
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
     
    @IBAction func didPressGo(_ sender:AnyObject) {
        
        let text = textfield.text
        let url = URL(string: text!)
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        
    }
    func textFieldShouldReturn(_ text: UITextField) -> Bool{
        //textfield.text?.hasPrefix("https://")

        text.resignFirstResponder()
       let text = textfield.text
       // let url = NSURL(string: text!)
        //let request = NSURLRequest(URL: url!)
       // webView.loadRequest(request)
        
        
        
        if text!.hasPrefix("https://") {
            let url = URL(string: text!)
            let request = URLRequest(url: url!)
            webView.loadRequest(request)
            
        }else {
            let phoneNumber = text
            var text = textfield.text
            text = "https://" + phoneNumber!
            let url = URL(string: text!)
            let request = URLRequest(url: url!)
            webView.loadRequest(request)
            
        }

        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: ({
            self.textfield.textAlignment = .center
            
        }), completion: nil)
        

        return true;
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textfield.text?.hasPrefix("https://")
        UIView.animate(withDuration: 5, animations: {
            
            self.textfield.textAlignment = .left
            
        })
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doRefresh(_ sender: AnyObject) {
        webView.reload()
    }
    
    @IBAction func goBack(_ sender:AnyObject) {
                self.webView.goBack()
    }
    
    @IBAction func goForward(_ sender:AnyObject) {
                self.webView.goForward()

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
    
    
    @IBAction func stop(_ sender:AnyObject) {
        webView.stopLoading()
    }
    
    func stop1() {
        

        webView.stopLoading()
                    print("stop")
        UIApplication.shared.isNetworkActivityIndicatorVisible = false


    }
func doRefresh1() {
        webView.reload()
    
    print("start")
    }
    


        func webViewDidStartLoad (_ sender : UIWebView) {
        refreshbutton.setTitle("❌", for: UIControlState())
        refreshbutton.addTarget(self, action: #selector(webbrowser.stop1), for: .touchUpInside)
        activity.startAnimating()
        NSLog("The webview start load")
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    func webViewDidFinishLoad(_ sender :UIWebView) {
        refreshbutton.setTitle("🔄", for: UIControlState())
     
        refreshbutton.addTarget(self, action: #selector(webbrowser.doRefresh1), for: .touchUpInside)
         activity.stopAnimating()
        NSLog("Webview finished")
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        if UIDevice.current.orientation.isLandscape {
           print("landscape")
            self.testarrow0.isUserInteractionEnabled = true
                   self.testarrow1.isUserInteractionEnabled = true
            
            self.testarrow0.isHidden = false
            self.testarrow1.isHidden = false
    }
    
        if UIDevice.current.orientation.isPortrait {
        
            self.testarrow0.isUserInteractionEnabled = false
            self.testarrow1.isUserInteractionEnabled = false
            self.testarrow0.isHidden = true
            self.testarrow1.isHidden = true

        
         }
    }
    
    
    
    
    
 }

    

