//
//  CryptoData.swift
//  seugarcom
//
//  Created by Alysson Nazareth on 03/04/16.
//  Copyright © 2016 RAH. All rights reserved.
//

import CryptoSwift

open class CryptoData {
    static func Safe(_ value: String) -> String {
        let key : String = SettingsManager.get("RAH.SecretKey")!
        let iv : String = SettingsManager.get("RAH.IV")!
        return try! EncodeTo64(value.encrypt(cipher: AES(key: key, iv: iv)))
    }
    
    fileprivate static func EncodeTo64(_ value: String) -> String {
        let plainData = (value as NSString).data(using: String.Encoding.utf8.rawValue)
        return plainData!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
    }
    
    fileprivate static func DecodeFrom64(_ value: String) -> NSString {
        let decodedData = Data(base64Encoded: value, options:NSData.Base64DecodingOptions(rawValue: 0))
        return NSString(data: decodedData!, encoding: String.Encoding.utf8.rawValue)!
    }
}
