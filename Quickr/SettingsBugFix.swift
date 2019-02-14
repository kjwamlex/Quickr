//
//  SettingsBugFix.swift
//  OSZSWIFT2
//
//  Created by 김준우 on 2015. 7. 9..
//  Copyright © 2015년 김준우. All rights reserved.
//

import UIKit

class settingsbugfix: UITableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //itemId[1] - Item Id
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    

    @IBAction func didpress(_ sender: AnyObject!) {
        
        
        
        UIApplication.shared.openURL(URL(string:UIApplicationOpenSettingsURLString)!);
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
    }
}

