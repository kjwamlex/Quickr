//
//  Main.swift
//  OS Z
//
//  Created by 김준우 on 2015. 6. 11..
//  Copyright (c) 2015년 김준우. All rights reserved.
//

import UIKit
import MediaPlayer
import WebKit

class Main: UIViewController, UITableViewDelegate,  UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet var animatedView: UIButton!
    @IBOutlet var animatedMessageView: UIView!
    @IBOutlet var uiview:UIView!
    
    @IBOutlet var iconimage: UIButton!
    
    @IBOutlet var image: UIImageView!
    
    @IBOutlet var shimmeringLabel: UIButton!
    
    @IBOutlet var tabelView: UITableView!
    
    @IBOutlet var searchBar: UISearchBar!
    
    
    
    var is_searching: Bool!
    
    var dataArray: NSMutableArray!
    
    var searchingdataarray: NSMutableArray!
    
    var shimmeringView: FBShimmeringView!
    
    @IBAction func clockanimation(_ sender: UIButton!) {
        
        
        UIView.animate(withDuration: 0.3,animations: {
            
            UIApplication.shared.statusBarStyle = .default

            
            
        })
        
        UIView.animate(withDuration: 0.75, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: ({
            
            
            self.view.transform = CGAffineTransform(scaleX: 25, y: 25)

            
        }), completion: nil)

        
        
            }
    
    @IBAction func clockdo(_ sender: UIButton!) {
        self.image.image = UIImage(named: "")
        
        self.image.backgroundColor = UIColor.black
        
    }

    
    @IBAction func messagedoanimation(_ sender: UIButton!) {
        
        
        let image = UIImage(named: "1431943936_messages_ios7_ios_7") 
        
        UIView.animate(withDuration: 0.5, animations: {
            //self.shimmeringView = FBShimmeringView(frame: self.shimmeringLabel.bounds)
            
            //imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height*2/3))
            //self.animatedMessageView = UIButton(frame: UIApplication.sharedApplication().delegate!.window!!.bounds)
            
            //self.animatedMessageView.transform = frame:UIApplication.sharedApplication().delegate!.window!!.bounds
        })
        
        self.iconimage.imageView!.image == "1431943936_messages_ios7_ios_7"
       iconimage.setImage(image, for: UIControlState())
    }

    

    @IBAction func performAnimation(_ sender: UIButton!) {
        
        let image = UIImage(named: "1432029291_safari_ios7_ios_7") 
        
        self.iconimage.imageView!.image == "1432029291_safari_ios7_ios_7"
        iconimage.setImage(image, for: UIControlState())
    }
   
    @IBOutlet var youtubemain: UIWebView!

    
    var count = 0
    
    var timer = Timer()
    
    @IBOutlet var firstanime: UIView!

    
    @IBOutlet var secondanime: UIView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.firstanime.transform = CGAffineTransform(scaleX: 5, y: 5)

        
        self.searchBar.alpha = 0
        
        self.searchBar.transform = CGAffineTransform(scaleX: 5, y: 5)
        
        //self.safari.alpha = 0
        
        //self.safari.transform = CGAffineTransformMakeScale(5,5)
        
        //self.music.transform = CGAffineTransformMakeScale(5, 5)
        
        
        //self.music.alpha = 0
        
        
        if UIDevice.current.orientation.isLandscape {
            
            self.secondanime.alpha = 0

        }
        
        if UIDeviceOrientation.landscapeLeft.isFlat {
            
            self.secondanime.alpha = 0
            
        }
        
        if UIDeviceOrientation.landscapeRight.isFlat {
            
            self.secondanime.alpha = 0
            
        }

        
        self.secondanime.transform = CGAffineTransform(scaleX: 20, y: 20)
        
        self.iconimage.alpha = 0
        
       // self.animatedMessageView.transform = CGAffineTransformMakeScale(5, 5)
        
        //self.animatedMessageView.alpha = 0
       
        
       //self.safarilabel.alpha = 0
        
        //self.musiclabel.alpha = 0
        
       // self.messagelabel.alpha = 0
        
        self.shimmeringLabel.alpha = 0
        


        
    }
    
    @IBOutlet var safarilabel: UILabel!
    
    @IBOutlet var musiclabel: UILabel!
    
    @IBOutlet var messagelabel: UILabel!
    @IBOutlet var safari: UIButton!
    
    @IBOutlet var music: UIButton!
    
    
    override func viewDidAppear(_ animated: Bool ) {
        /*
        
        UIView.animateWithDuration(0.75, animations: {
        
            self.safari.alpha = 1
            
            self.safari.transform = CGAffineTransformMakeScale(1, 1)
            
 
            
            self.music.transform = CGAffineTransformMakeScale(1, 1)
            
            self.music.alpha = 1
            
            
            self.iconimage.alpha = 1
            
            self.animatedMessageView.alpha = 1
        self.animatedMessageView.transform = CGAffineTransformMakeScale(1, 1)
            

            
            
        })
*/
        
        

        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: ({
            
            self.firstanime.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            //self.safari.alpha = 1
            
            //self.safari.transform = CGAffineTransformMakeScale(1, 1)
            

            
            self.searchBar.alpha = 1
            
            self.searchBar.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            self.iconimage.alpha = 1
            
            //self.animatedMessageView.alpha = 1
            
            //self.animatedMessageView.transform = CGAffineTransformMakeScale(1, 1)
        }), completion: nil)
        
        UIView.animate(withDuration: 0.75, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: ({
            
            //self.music.transform = CGAffineTransformMakeScale(1, 1)
            
            //self.music.alpha = 1
            
            self.secondanime.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.secondanime.alpha = 1



            
        }), completion: nil)

        
        
        UIView.animate(withDuration: 0.85, animations: {
            
            self.shimmeringLabel.alpha = 1
            
            self.musiclabel.alpha = 1
            
            self.messagelabel.alpha = 1
            
                       //self.safarilabel.alpha = 1
            
            
            })
    }
    
    
    let userDefaults = UserDefaults.standard

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        is_searching = false
        
        dataArray = ["Message", "Safari", "Music", "Beats1", "Phone", "Calculator", "Maps", "Camera" , "FaceBook", "Twitter", "Youtube", "Settings"]
        
        searchingdataarray = []
        
        self.tabelView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.shimmeringView = FBShimmeringView(frame: self.shimmeringLabel.bounds)
        self.view.addSubview(self.shimmeringView)
        self.shimmeringLabel.frame = self.shimmeringView.bounds
        self.shimmeringView.contentView = shimmeringLabel
        self.shimmeringView.isShimmering = true
        self.shimmeringView.shimmeringBeginFadeDuration = 1;
        self.shimmeringView.shimmeringOpacity = 0.1;
        self.iconimage.bringSubview(toFront: self.view)
        self.animatedMessageView.bringSubview(toFront: self.view)
        
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)
        //-----------up swipe gestures in view--------------//
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(Main.upSwiped))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
 self.view.addGestureRecognizer(swipeUp)
        
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(Main.handlePan(_:)))
        self.firstanime.addGestureRecognizer(gestureRecognizer)
        

        
    }
    
    
     func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizerState.began || gestureRecognizer.state == UIGestureRecognizerState.changed {
            
            let translation = gestureRecognizer.translation(in: self.view)
            // note: 'view' is optional and need to be unwrapped
}
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if is_searching == true{
            self.tabelView.alpha = 1
            return searchingdataarray.count
        }else{
            
            return dataArray.count  //Currently Giving default Value
        }
    }
    
    
     func tableView(_ tableView: UITableView , didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)

        
        if searchingdataarray == ["Settings"] {
            
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "settings")
            
            self.show(vc as! UIViewController, sender: vc)
        }
        
        if searchingdataarray == ["Beats1"] {
            
            let vc: AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "beats1")
            self.show(vc as! UIViewController, sender: vc)
            
            print("open")
        }

        if searchingdataarray == ["Calculator"] {
            
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "calc")
            
            self.show(vc as! UIViewController, sender: vc)
        }

        if searchingdataarray == ["Maps"] {
            
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "maps")
            self.show(vc as! UIViewController, sender: vc)
        }
        
        if searchingdataarray == ["Phone"] {
            
            let vc: AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "phone")
            self.show(vc as! UIViewController, sender: vc)        }

        if searchingdataarray == ["Camera"] {
            
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "camera")
            self.show(vc as! UIViewController, sender: vc)
        }
        if searchingdataarray == ["FaceBook"] {
            
            let vc: AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "facebook")
            self.show(vc as! UIViewController, sender: vc)
        }
        if  searchingdataarray == ["Twitter"] {
            
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "twitter")
            self.show(vc as! UIViewController, sender: vc)
        
        }
        
        


        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        if is_searching == true{
            
            UIView.animate(withDuration: 0.5, animations: {
            self.tabelView.alpha = 1
                
                })
            
            cell.textLabel!.text = searchingdataarray[(indexPath as NSIndexPath).row] as! NSString as String
        }else{
            UIView.animate(withDuration: 0.3, animations: {
                self.tabelView.alpha = 0
                
            })
            cell.textLabel!.text = dataArray[(indexPath as NSIndexPath).row] as! NSString
 as String        }
        return cell;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchBar.text!.isEmpty{
            searchBar.resignFirstResponder()
            is_searching = false
            tabelView.reloadData()
        } else {
            is_searching = true
            searchingdataarray.removeAllObjects()
            for index in 0 ..< dataArray.count
            {
                let currentString = dataArray.object(at: index) as! String
                if currentString.lowercased().range(of: searchText.lowercased())  != nil {
                    searchingdataarray.add(currentString)
                    
                }
            }
            tabelView.reloadData()
        }
    }
    
    func textFieldShouldReturn(_ text: UISearchBar) -> Bool{
        searchBar.resignFirstResponder()
        
        
 
        return true;
    }


    func upSwiped() {
        
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 3.0, options: UIViewAnimationOptions(), animations: ({
            
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "apptestnavigation")

            
            self.show(vc as! UIViewController, sender: vc)

            
        }), completion: nil)

        
    }
    
    @IBAction func performSegue(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "customSegue", sender: self)
        
    }
    
    @IBAction func performSeguemessage(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "customSegue1", sender: self)
        
    }
    @IBAction func performsegueclock(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "customSegue2", sender: self)
        
    }
    
    
    @IBAction func DidPressMusic(_ sender:UIButton!) {
        let mediaItems = MPMediaQuery.songs().items
        let mediaCollection = MPMediaItemCollection(items: mediaItems!)
        
        let url = URL(string: "http://itunes.apple.com/ca/station/")
        
        let request = URLRequest(url: url!)
        youtubemain.loadRequest(request)

        
        let player = MPMusicPlayerController.systemMusicPlayer()
        player.setQueue(with: mediaCollection)
                
        var query = MPMediaQuery.songs()
    }
    
    func showAlertController(_ message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
        
        
        
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        //if UIDevice.currentDevice().orientation.isLandscape.boolValue {
         //   print("landscape")
           // image.image = UIImage(named: "iOS-8-Apple-iPhone-6-Plus-Earth-Retina-Wallpaper.jpg")
        //}
        
        //if UIDevice.currentDevice().orientation.isPortrait.boolValue {
            
       //     image.image = UIImage(named: "iPhone 6 Official Wallpapers (Earth)")
            
       // }
        
      //  if UIDeviceOrientation.Portrait.isPortrait {
       //      image.image = UIImage(named: "iPhone 6 Official Wallpapers (Earth)")
    //
    //    }
        
       // if UIDeviceOrientation.LandscapeLeft.isLandscape    {
       //     image.image = UIImage(named: "iOS-8-Apple-iPhone-6-Plus-Earth-Retina-Wallpaper.jpg")

            
      //  }
        
        //if UIDeviceOrientation.LandscapeLeft.isLandscape {
        //    image.image = UIImage(named: "iOS-8-Apple-iPhone-6-Plus-Earth-Retina-Wallpaper.jpg")
            
            
       // }

    }
    
    
    
}
