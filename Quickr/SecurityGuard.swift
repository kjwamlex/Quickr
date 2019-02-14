
import UIKit
import LocalAuthentication

class SecurityGuard: UIViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let touchIDAuth : TouchID = TouchID()
        touchIDAuth.touchIDReasonString = "To access the app."
        touchIDAuth.touchIDAuthentication()

    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Touch ID Authentication
    
   
    
    // MARK: Password Alert
    
    func showPasswordAlert()
    {
        let alertController = UIAlertController(title: "Touch ID Password", message: "Please enter your password.", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Cancel) { (action) -> Void in
            
            if let textField = alertController.textFields?.first as UITextField?
            {
                if textField.text == "quick"
                {
                    print("Authentication successful! :) ")
                    let vc: AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("main")
                    self.showViewController(vc as! UIViewController, sender: vc)

                }
                else
                {
                    self.showPasswordAlert()
                }
            }
        }
        alertController.addAction(defaultAction)
        
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            
            textField.placeholder = "Password"
            textField.secureTextEntry = true
            
        }
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}

