//
//  SettingsManager.swift
//  seugarcom
//
//  Created by Alysson Nazareth on 02/12/15.
//  Copyright © 2015 RAH. All rights reserved.
//
import UIKit

open class SettingsManager {
    static func get(_ config:String) -> String! {
        var myDict: NSDictionary?
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        
        if let dict = myDict {
            if (dict["RAH"] != nil) {
                for(key, value) in dict["RAH"] as! NSDictionary {
                    if (key as! String == config) {
                        return value as! String;
                    }
                }
            }
        }
        return nil;
    }
    
    static func getStringUserData(_ config: String) -> String! {
        let defaults = UserDefaults.standard
        if (defaults.object(forKey: config) != nil) {
            return defaults.string(forKey: config);
        }
        return nil;
    }
    
    static func setUserData(_ config: String, value: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.setValue(value, forKey: config)
    }
}
