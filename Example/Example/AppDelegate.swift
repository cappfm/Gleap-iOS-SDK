//
//  AppDelegate.swift
//  Example
//
//  Created by Lukas Boehler on 05.12.21.
//

import UIKit
import Gleap

@main
class AppDelegate: UIResponder, UIApplicationDelegate, GleapDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Gleap.enableDebugConsoleLog()
        
        Gleap.setDisableInAppNotifications(false);
        
        Gleap.setLanguage("de")
        
        //Gleap.setApiUrl("http://localhost:9000")
        // Gleap.setFrameUrl("http://localhost:3001/appnew.html")
        Gleap.initialize(withToken: "ogWhNhuiZcGWrva5nlDS8l7a78OfaLlV")
        
        Gleap.sharedInstance().delegate = self
        
        // Attach custom data sample.
        Gleap.attachCustomData(["value": "Unicorn", "type": "Demo", "ExtraInfo": ["Age": "28", "City": "San Francisco"]])
        
        Gleap.showFeedbackButton(true)
        
        let userProperty = GleapUserProperty()
        userProperty.name = "Franz"
        userProperty.email = "franz@gleap.io"
        userProperty.phone = "+1 (902) 123123"
        userProperty.value = 199.95
        userProperty.companyId = "Gleap #123"
        userProperty.companyName = "Gleap GmbH"
        userProperty.plan = "Pro plan"
        userProperty.customData = [
            "company": "ACME inc."
        ]
        Gleap.identifyUser(with: "129833", andData: userProperty)
        
        // Testing file attachments.
        if let data = "Dies ist ein test.".data(using: String.Encoding.utf8) {
            Gleap.addAttachment(with: data, andName: "text.txt")
        }
        
        // Some demo logs.
        print("App started.")
        print("User logged in.")
        
        return true
    }
    
    func registerPushMessageGroup(_ pushMessageGroup: String) {
        NSLog("Register: " + pushMessageGroup)
    }
    
    func unregisterPushMessageGroup(_ pushMessageGroup: String) {
        NSLog("Unregister: " + pushMessageGroup)
    }
    
    func initialized() {
        
    }
    
    func notificationCountUpdated(_ count: Int32) {
        NSLog("Count updated. %i", count);
    }
    
    func widgetClosed() {
        NSLog("Closed widget.")
    }
    
    func widgetOpened() {
        NSLog("Opened widget.")
    }
    
    func feedbackFlowStarted(_ feedbackAction: [AnyHashable : Any]) {
        NSLog("Started feedback flow", feedbackAction)
    }
    
    func feedbackSendingFailed() {
        NSLog("Sending feedback failed")
    }
    
    func feedbackSent(_ data: [AnyHashable : Any]) {
        NSLog("Feedback sent", data)
    }
    
    func customActionCalled(_ customAction: String) {
        NSLog(customAction)
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

