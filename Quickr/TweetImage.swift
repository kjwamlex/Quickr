//
//  TweetImage.swift
//  OS Z
//
//  Created by 김준우 on 2015. 6. 24..
//  Copyright (c) 2015년 김준우. All rights reserved.
//
import UIKit
import Social
import QuartzCore

class tweetImage: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate {
    
    
    
    @IBOutlet var webView: UIWebView!

    var screenEdgeRecognizer: UIScreenEdgePanGestureRecognizer!
    
    var goforwardgest: UIScreenEdgePanGestureRecognizer!
    
    @IBOutlet var imageArrowView : UIImageView!

    var pickerController:UIImagePickerController = UIImagePickerController()
    
    /*
    @IBAction func chooseImagePressed(sender: UIButton) {
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func tweetButtonPressed(sender: UIButton) {
        // Do any additional setup after loading the view, typically from a nib.
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            let tweetSheet = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            tweetSheet.setInitialText(text.text)
            tweetSheet.addImage(imageView.image)
            
            self.presentViewController(tweetSheet, animated: true, completion: nil)
        } else {
            print("error")
        }
    }

*/
    
    
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

    
    
    @IBAction func postTotwitter(_ sender: UIButton) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            let controller = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            controller?.setInitialText("")
            self.present(controller!, animated:true, completion:nil)
        }
            
        else {
            self.showAlertController("You don't have Twitter account")
        }
    }
    
    func showAlertController(_ message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)

        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
self.webView.backgroundColor = UIColor.groupTableViewBackground
        
           navigationController?.navigationBar.barTintColor = UIColor(red: 29/255.0, green:202/255.0, blue:255/255.0, alpha:1.0)
        let url = URL(string: "https://mobile.twitter.com/session/new")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)

          self.view.backgroundColor = UIColor.groupTableViewBackground
        screenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self,
            action: #selector(tweetImage.gobackgest(_:)))
        screenEdgeRecognizer.edges = .left
        view.addGestureRecognizer(screenEdgeRecognizer)
        
        
        goforwardgest = UIScreenEdgePanGestureRecognizer(target: self,
            action: #selector(tweetImage.goForwards(_:)))
        goforwardgest.edges = .right
        view.addGestureRecognizer(goforwardgest)


        }
    
/*


  func textFieldShouldReturn(text: UITextField) -> Bool{
        text.resignFirstResponder()
        
    return true;
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

*/
    
}

