//
//  CustomSegue.swift
//  Custom Segue Swift 2 2015
//
//  Created by PJ Vea on 8/4/15.
//  Copyright © 2015 Vea Software. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue
{
    override func perform()
    {
        let sourceVC = self.source
        let destinationVC = self.destination
        
        sourceVC.view.addSubview(destinationVC.view)
        
        destinationVC.view.transform = CGAffineTransform(scaleX: 0.0005, y: 0.0005)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions(), animations: { () -> Void in
            
            destinationVC.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
            }) { (finished) -> Void in
                
                destinationVC.view.removeFromSuperview()
                
                let time = DispatchTime.now() + Double(Int64(0.001 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
                
                DispatchQueue.main.asyncAfter(deadline: time) {
                    
                    sourceVC.present(destinationVC, animated: false, completion: nil)
                    
                }
        }
    }
}
