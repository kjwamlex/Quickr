//
//  ViewController.swift
//  UI
//
//  Created by 김준우 on 2015. 6. 29..
//  Copyright (c) 2015년 김준우. All rights reserved.
//

import UIKit

import MessageUI

let reuseIdentifier = "MyCell"


class clock: UIViewController {
    
    

    @IBOutlet var bugfixview: UIView!
    
    var timer: Timer!
    
    var dateFormatter: DateFormatter!
    
    @IBOutlet var clockLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(clock.counter), userInfo: nil, repeats: true)

        
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(clock.updateClock), userInfo: nil, repeats: true)
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.none
        dateFormatter.timeStyle = DateFormatter.Style.medium
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        UIApplication.shared.isIdleTimerDisabled = false
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        updateClock()
    }
    
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func updateClock() {
        let timeToDisplay = dateFormatter.string(from: Date())
        clockLabel.text = timeToDisplay
    }
    
    


var count = 0

    @IBAction func bugfix(_ sender: AnyObject!) {
        
        bugfixview.backgroundColor = UIColor.white

        
    }
func counter() {
    count += 1
    
    if (count == 1) {
        self.view.backgroundColor = UIColor.white
            self.view.alpha = 1
            
            
        
    }
    

    
    func layoutAttributesForElementsInRect(_ rect: CGRect) -> [AnyObject]? {
        
        let attributes = [AnyObject]()
        
        return attributes
        
    }

    
}
}

