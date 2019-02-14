//
//  Settings.swift
//  
//
//  Created by 김준우 on 2015. 6. 25..
//
//

import UIKit

class settings: UITableViewController {
    
  
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //itemId[1] - Item Id
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.groupTableViewBackground
        UIApplication.shared.statusBarStyle = .default
        
        
        super.viewDidLoad()
    }
    
    
}
