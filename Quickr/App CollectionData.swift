//

import UIKit

import MessageUI

class AlbumViewController: UICollectionViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet var blurimage: UIImageView!
    
    var Albums = ["1433584621_phone_ios7_ios_7.png","1437474315_maps_ios7_ios_7.png","1433584784_camera_ios7_ios_7.png", "Facebook.png",    "1433584698_mail_ios7_ios_7.png","1432029433_music_ios7_ios_7.png", "twitter-icon.png" , "Youtube-iOS7-Icon-cssauthor.com_.png", "1432029291_safari_ios7_ios_7.png", "1431943936_messages_ios7_ios_7.png","1433499137_settings_ios7_ios_7.png" ]
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            print("landscape")
            self.blurimage.image = UIImage(named: "iOS-8-Apple-iPhone-6-Plus-Earth-Retina-Wallpaper.jpg")
        } else {
            print("portraight")
            self.blurimage.image = UIImage(named: "iPhone 6 Official Wallpapers (Earth)")
        }
    }
    
//"1433584679_calculator_ios7_ios_7.png",
    
    func downSwiped() {
       // let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("apptest")
        self.dismiss(animated: true, completion: nil)
        
        UIApplication.shared.statusBarStyle = .lightContent

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let swipedown = UISwipeGestureRecognizer(target: self, action: #selector(AlbumViewController.downSwiped))
        swipedown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipedown)
        
        UIApplication.shared.statusBarStyle = .default
        
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.black]

   

       
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

    func messageComposeViewController(_ controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        switch (result.rawValue) {
        case MessageComposeResult.cancelled.rawValue:
            print("Message was cancelled")
            self.dismiss(animated: true, completion: nil)
        case MessageComposeResult.failed.rawValue:
            print("Message failed")
            self.dismiss(animated: true, completion: nil)
        case MessageComposeResult.sent.rawValue:
            print("Message was sent")
            self.dismiss(animated: true, completion: nil)
        default:
            break;
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView?) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView?, numberOfItemsInSection section: Int) -> Int {
        return Albums.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell : appimage = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! appimage
        cell.AlbumImage?.image = UIImage(named: Albums[(indexPath as NSIndexPath).row])
        
        if cell.AlbumImage!.image == UIImage(named:"1433499137_settings_ios7_ios_7.png"){
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "settings")
            self.show(vc as! UIViewController, sender: vc)

            UIView.animate(withDuration: 0.5,animations: {
                
            
                
                
                self.view.transform = CGAffineTransform(scaleX: 30, y: 30)
                
                
            })
        }//self.performSegueWithIdentifier("showView", sender: self)
        
        
        
        if cell.AlbumImage!.image == UIImage(named:"1433584784_camera_ios7_ios_7.png"){
            
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "camera")
            self.show(vc as! UIViewController, sender: vc)
            
            
            
            UIView.animate(withDuration: 0.5,animations: {
                
              
                
                
                self.view.transform = CGAffineTransform(scaleX: 30, y: 30)
                
                
            })
        }
        
        if cell.AlbumImage!.image == UIImage(named:"Youtube-iOS7-Icon-cssauthor.com_.png"){
            
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "youtube")
            self.show(vc as! UIViewController, sender: vc)
            
            
            
            UIView.animate(withDuration: 0.5,animations: {
                
                
                
                
                self.view.transform = CGAffineTransform(scaleX: 30, y: 30)
                
                
            })
        }
        if cell.AlbumImage!.image == UIImage(named:"twitter-icon.png"){
            
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "twitter")
            self.show(vc as! UIViewController, sender: vc)
            
            
            
            UIView.animate(withDuration: 0.5,animations: {
                
                
                
                self.view.transform = CGAffineTransform(scaleX: 30, y: 30)
                
                
            })
            
        }
        
        
        if cell.AlbumImage!.image == UIImage(named:"1432029291_safari_ios7_ios_7.png"){
            
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "webbrowser")
            self.show(vc as! UIViewController, sender: vc)
            
            
            
            UIView.animate(withDuration: 0.5,animations: {
                
                
                
                self.view.transform = CGAffineTransform(scaleX: 30, y: 30)
                
                
            })

            
        }

        
        if cell.AlbumImage!.image == UIImage(named:"1437474315_maps_ios7_ios_7.png"){
            
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "maps")
            self.show(vc as! UIViewController, sender: vc)
            
            
            
            UIView.animate(withDuration: 0.5,animations: {
                
                
                
                self.view.transform = CGAffineTransform(scaleX: 30, y: 30)
                
                
            })
            
        }

        
        if cell.AlbumImage!.image == UIImage(named:"Facebook.png"){
            
            
            let vc: AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "facebook")
            self.show(vc as! UIViewController, sender: vc)
            
            
            
            UIView.animate(withDuration: 0.5,animations: {
                
            
                
                
                self.view.transform = CGAffineTransform(scaleX: 30, y: 30)
                
                
            })
            
        }
        if cell.AlbumImage!.image == UIImage(named:"1433584679_calculator_ios7_ios_7.png"){
            
            let vc: AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "calc")
            self.show(vc as! UIViewController, sender: vc)
            
            
            
            UIView.animate(withDuration: 0.5,animations: {
                
                
                
                
                self.view.transform = CGAffineTransform(scaleX: 30, y: 30)
                
                
            })
            
            
            
        }

        if cell.AlbumImage!.image == UIImage(named:"1432029433_music_ios7_ios_7.png"){
            let vc: AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "beats1")
            self.show(vc as! UIViewController, sender: vc)
            
            UIView.animate(withDuration: 0.5,animations: {
                
                
                
                
                self.view.transform = CGAffineTransform(scaleX: 30, y: 30)
                
                
            })


            
            
        }
        if cell.AlbumImage!.image == UIImage(named:"1433584621_phone_ios7_ios_7.png"){
            
            let vc: AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "phone")
            self.show(vc as! UIViewController, sender: vc)
            
            UIView.animate(withDuration: 0.5,animations: {
                
                
                
                
                self.view.transform = CGAffineTransform(scaleX: 30, y: 30)
                
                
            })

            
            
            
        }
        
 

        if cell.AlbumImage!.image == UIImage(named: "1433584698_mail_ios7_ios_7.png") {
            if (MFMailComposeViewController.canSendMail()) {
                
                var emailTitle = ""
                
                var messageBody = "Sent from Quickr"
                

                
                
                
                var mc: MFMailComposeViewController = MFMailComposeViewController()
                
                
                mc.mailComposeDelegate = self
                
                mc.setSubject(emailTitle)
                
                mc.setMessageBody(messageBody, isHTML: false)
                
                
                
                self.present(mc, animated: true, completion: nil)
                
            }else {
                
                self.dismiss(animated: true, completion: nil)
            }
            
            func mailComposeController(_ controller:MFMailComposeViewController, didFinishWithResult result:MFMailComposeResult, error:NSError) {
                
                
                
                
                
                switch result.rawValue {
                case MFMailComposeResult.cancelled.rawValue:
                    print("Mail cancelled")
                case MFMailComposeResult.saved.rawValue:
                    print("Mail saved")
                case MFMailComposeResult.sent.rawValue:
                    print("Mail sent")
                case MFMailComposeResult.failed.rawValue:
                    print("Mail sent failure: \(error.localizedDescription)")
                default:
                    break
                }
                self.dismiss(animated: true, completion: nil)
                
            }
            
        
        }
        print("Cell \((indexPath as NSIndexPath).row) selected")
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
      
        
        let cell : appimage = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! appimage
        cell.AlbumImage?.image = UIImage(named: Albums[(indexPath as NSIndexPath).row])
        
        if cell.AlbumImage!.image == UIImage(named:"1437474315_maps_ios7_ios_7.png"){
            cell.Text.text = NSLocalizedString("Maps", comment:"Maps")


        }
        
        if cell.AlbumImage!.image == UIImage(named:"1433499137_settings_ios7_ios_7.png"){
            
            cell.Text.text = NSLocalizedString("Settings", comment:"Settings")
        }
        

        if cell.AlbumImage!.image == UIImage(named:"1433584784_camera_ios7_ios_7.png"){

            cell.Text.text =  NSLocalizedString("Camera", comment:"Camera")

            
        }
        if cell.AlbumImage!.image == UIImage(named:"twitter-icon.png"){
            
            cell.Text.text =  NSLocalizedString("Twitter", comment:"Twitter")
      
            
        }

        if cell.AlbumImage!.image == UIImage(named:"Facebook.png"){
            cell.Text.text =  NSLocalizedString("FaceBook", comment:"FaceBook")
        }
        
        if cell.AlbumImage!.image == UIImage(named:"1432029291_safari_ios7_ios_7.png"){
            cell.Text.text =  NSLocalizedString("Safari", comment:"Safari")
        }
        
        if cell.AlbumImage!.image == UIImage(named:"1431943936_messages_ios7_ios_7.png"){
            cell.Text.text =  NSLocalizedString("Messages", comment:"Messages")
        }

        
        if cell.AlbumImage!.image == UIImage(named:"1433584679_calculator_ios7_ios_7.png"){
     
            cell.Text.text =  NSLocalizedString("Calculator", comment:"Calculator")
          

            
        }
        if cell.AlbumImage!.image == UIImage(named:"1433584621_phone_ios7_ios_7.png"){

            cell.Text.text =  NSLocalizedString("Phone", comment:"Phone")
        

            
        }
        
        if cell.AlbumImage!.image == UIImage(named:"1433584698_mail_ios7_ios_7.png"){

            cell.Text.text =  NSLocalizedString("MailNow", comment:"MailNow")
        

            
        }


        
        if cell.AlbumImage!.image == UIImage(named:"1432029433_music_ios7_ios_7.png"){
            
            cell.Text.text = ("Beats 1")
            
        }

        if cell.AlbumImage!.image == UIImage(named:"Youtube-iOS7-Icon-cssauthor.com_.png"){
            
            cell.Text.text = ("Youtube")
            
        }


     
        return cell
    

}

}
