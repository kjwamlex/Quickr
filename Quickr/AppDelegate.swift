 
//

import UIKit
import MessageUI
import AddressBook
import AddressBookUI



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.statusBarStyle = .default
        
        
        //application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Badge ,categories: nil))
        
        //var localNotification:UILocalNotification = UILocalNotification()
        
        //localNotification.alertAction = "open Quickr"
        
        //localNotification.alertBody = "If your phone is slow, use Quickr."
        
        //localNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
        
       // UIApplication.sharedApplication().scheduleLocalNotification(localNotification)

        
        return true
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void)
    {
        let handledShhortcutItem = self.handleShortcutItem(shortcutItem)
        completionHandler(handledShhortcutItem)
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        self.window?.rootViewController?.dismiss(animated: false, completion: nil)

    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    enum ShortcutIdentifier: String
    {
        case First
        case Second
        case Third
        case Fourth
        
        init?(fullType: String)
        {
            guard let last = fullType.components(separatedBy: ".").last else {return nil}
            self.init(rawValue: last)
        }
        
        var type: String
            {
                return Bundle.main.bundleIdentifier! + ".\(self.rawValue)"
        }
        
    }

   
    func handleShortcutItem(_ shortcutItem: UIApplicationShortcutItem) -> Bool
    {
        var handled = false
        //Messages
        guard ShortcutIdentifier(fullType: shortcutItem.type) != nil else { return false }
        guard let shortcutType = shortcutItem.type as String? else { return false }
        
        switch (shortcutType)
        {
        case ShortcutIdentifier.First.type:
            handled = true
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navVC = storyboard.instantiateViewController(withIdentifier: "camera")
            self.window?.rootViewController?.present(navVC, animated: true, completion: nil)
            

            break
        case ShortcutIdentifier.Second.type:
            handled = true
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navVC = storyboard.instantiateViewController(withIdentifier: "webbrowser")
            self.window?.rootViewController?.present(navVC, animated: true, completion: nil)
            break
            
        case ShortcutIdentifier.Third.type:
            handled = true
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navVC = storyboard.instantiateViewController(withIdentifier: "somemess")
            self.window?.rootViewController?.present(navVC, animated: true, completion: nil)
            
            
            break
            
        case ShortcutIdentifier.Fourth.type:
            handled = true
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navVC = storyboard.instantiateViewController(withIdentifier: "beats1")
            self.window?.rootViewController?.present(navVC, animated: true, completion: nil)
            
            
            break

        default:
            break
        }
        
        return handled
        
    }
    // MARK: - Core Data stack
    

    
}

