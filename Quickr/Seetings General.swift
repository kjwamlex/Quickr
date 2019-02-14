//
//  Seetings General.swift
//  OSZSWIFT2
//
//  Created by 김준우 on 2015. 7. 13..
//  Copyright © 2015년 김준우. All rights reserved.
//

import UIKit

class general: UIViewController {
    
    override func viewDidLoad() {
            UIApplication.shared.openURL(URL(string:UIApplicationOpenSettingsURLString)!);
    
}

}
