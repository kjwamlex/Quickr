//
//  Device.swift
//  SwiftDevice
//
//  Created by Chris on 4/02/2015.
//  Copyright (c) 2015 Victory One Media Pty Ltd. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
    
    func platformName() -> String {
        
        switch ( Device.getCurrentDevice() ) {
            
        case .iPhone1stGeneration:
            return "iPhone 1st Generation"
            
        case .iPhone3G:
            return "iPhone 3G"
            
        case .iPhone3GS:
            return "iPhone 3GS"
            
        case .iPhone4:
            return "iPhone 4"
            
        case .iPhone4S:
            return "iPhone 4S"
            
        case .iPhone5:
            return "iPhone 5"
            
        case .iPhone5C:
            return "iPhone 5C"
            
        case .iPhone5S:
            return "iPhone 5S"
            
        case .iPhone6:
            return "iPhone 6"
            
        case .iPhone6Plus:
            return "iPhone 6 Plus"
            
            
        case .iPodTouch1stGeneration:
            return "iPod Touch 1st Generation"
            
        case .iPodTouch2ndGeneration:
            return "iPod Touch 2nd Generation"
            
        case .iPodTouch3rdGeneration:
            return "iPod Touch 3rd Generation"
            
        case .iPodTouch4thGeneration:
            return "iPod Touch 4th Generation"
            
        case .iPodTouch5thGeneration:
            return "iPod Touch 5th Generation"
            
            
        case .iPad1stGeneration:
            return "iPad 1st Generation"
            
        case .iPad2:
            return "iPad 2"
            
        case .iPadMini:
            return "iPad Mini"
            
        case .iPad3rdGeneration:
            return "iPad 3rd Generation"
            
        case .iPad4thGeneration:
            return "iPad 4th Generation"
            
        case .iPadAir:
            return "iPad Air"
            
        case .iPadMini2:
            return "iPad Mini 2"
            
        case .iPadMini3:
            return "iPad Mini 3"
            
        case .iPadAir2:
            return "iPad Air 2"
            
        default:
            return "Unknown"
        }
    }
}

enum Device : CInt {
    
    case unknown = 0
    
    case iPhone1stGeneration = 101
    case iPhone3G = 102
    case iPhone3GS = 103
    case iPhone4 = 104
    case iPhone4S = 105
    case iPhone5 = 106
    case iPhone5C = 107
    case iPhone5S = 108
    case iPhone6 = 109
    case iPhone6Plus = 110
    
    case iPodTouch1stGeneration = 201
    case iPodTouch2ndGeneration = 202
    case iPodTouch3rdGeneration = 203
    case iPodTouch4thGeneration = 204
    case iPodTouch5thGeneration = 205
    
    case iPad1stGeneration = 301
    case iPad2 = 302
    case iPadMini = 303
    case iPad3rdGeneration = 304
    case iPad4thGeneration = 305
    case iPadAir = 306
    case iPadMini2 = 307
    case iPadMini3 = 308
    case iPadAir2 = 309
    
    static func getCurrentDevice() -> Device {
        
   
        
        return .unknown
    }
}
