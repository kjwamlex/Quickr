//
//  Wallpaper.swift
//  Quickr
//
//  Created by 김준우 on 2015. 8. 7..
//  Copyright © 2015년 김준우. All rights reserved.
//

import UIKit



class wallpapersetitng:UIViewController {
    
    @IBAction func rainbow(_ sender: AnyObject) {
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "rainbow"), object: nil)

        
    }
}
