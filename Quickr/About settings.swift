//
//  About settings.swift
//  OS Z
//
//  Created by 김준우 on 2015. 6. 25..
//  Copyright (c) 2015년 김준우. All rights reserved.
//

import UIKit


class aboutsettings:UITableViewController {
    
    @IBOutlet var versionLabel:UILabel!
    
    
    @IBOutlet var RAMLABEL: UILabel!
    
    @IBOutlet var ppiLabel: UILabel!
    
    @IBOutlet var processorlabel: UILabel!
    
    
    
    @IBOutlet var battery: UILabel!
    
    
    
    @IBAction func didpressgotoiosst(_ sender:UIButton!) {
    
    UIApplication.shared.openURL(URL(string:UIApplicationOpenSettingsURLString)!);
    
        
    }
    
    override func viewDidLayoutSubviews() {
        battery.text = "\(UIDevice.current.batteryLevel)%"

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let os = ProcessInfo().operatingSystemVersion
        let version = "iOS \(os.majorVersion).\(os.minorVersion).\(os.patchVersion)"
        self.view.backgroundColor = UIColor.white
        versionLabel.text = version
    
        
UIDevice.current.isBatteryMonitoringEnabled = true
        
        
              
        if DeviceType.IS_IPHONE_4S {
                        RAMLABEL.text = "528MB"
            ppiLabel.text = "326ppi"
            processorlabel.text = "A8 800Mhz Dual Core 32bit"
 
        }
        
        if DeviceType.IS_IPHONE_5S {
         
            RAMLABEL.text = "1GB"
            ppiLabel.text = "326ppi"
            processorlabel.text = "A7 1.4Ghz Dual Core 64bit"
        }

        
        if DeviceType.IS_IPHONE_5 {
         
            RAMLABEL.text = "1GB"
            ppiLabel.text = "326ppi"
            processorlabel.text = "A6 1.3Ghz Dual Core 32bit"
        }
        if DeviceType.IS_IPHONE_6 {
            RAMLABEL.text = "1GB"
            ppiLabel.text = "326ppi"
            processorlabel.text = "A8 1.4Ghz Dual Core 64bit"
        }
        if DeviceType.IS_IPHONE_6P {
            RAMLABEL.text = "1GB"
            ppiLabel.text = "401ppi"
            processorlabel.text = "A8 1.4Ghz Dual Core 64bit"
        }


    }
    
    
    
    
    
    enum UIUserInterfaceIdiom : Int
    {
        case unspecified
        case phone
        case pad
    }
    
    struct ScreenSize
    {
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct DeviceType
    {
        static let IS_IPHONE_4S         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_HEIGHT == 1152.0
        static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_5S         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_HEIGHT == 1238.0
        static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    }

    
}


