//
//  Protocol.swift
//  seugarcom
//
//  Created by Alysson Nazareth on 23/03/16.
//  Copyright © 2016 RAH. All rights reserved.
//

import Foundation
import UIKit

protocol ProtocolDelegate {
    func OnBeforeSendMessage() -> Void
    func OnFinishSendMessage() -> Void
}

extension ProtocolDelegate {
    func OnBeforeSendMessage(){
        // leaving this empty
    }
    
    func OnFinishSendMessage(){
        // leaving this empty
    }
}

class Protocol {
    var Delegate: ProtocolDelegate!
    var Url : String!
    var Result : NSDictionary!
    
    enum Methods : String {
        case POST, GET, DELTE, PUT
    }
    
    enum ProtocolError : Error {
        case urlInvalid
        case emptyResponse
        case fail
    }
    
    var Method : Methods = .POST
    var Params : Dictionary<String, String> = [String: String]()
    
    func AddParameter(_ name: String, value: String){
        Params[name] = value

    }
    
    func Send(_ successCallback: @escaping ((NSDictionary!) -> Void), errorCallback: @escaping ((String) -> Void)) {
        Delegate.OnBeforeSendMessage()
        
        let url = URL(string: Url)!
        print("Enviando requisição p/ \(Url)")
        var request = URLRequest(url: url)
        
        request.httpMethod = Method.rawValue as String;

        
        var body = [String]()
        
        for (myKey,myValue) in Params {
            body.append("\"\(myKey)\":\"\(myValue)\"")
        }
        
        
        
        //configure default package
        let deviceId = UIDevice.current.identifierForVendor?.uuidString
        
        body.append("\"timestamp\":\"\(Date())\"")
        body.append("\"deviceId\":\"\(deviceId!)\"")
        
        let data = "{ \(body.joined(separator: ",")) }"
        
        request.httpBody = "crypto=\(CryptoData.Safe(data)) }".data(using: String.Encoding.utf8)
        
        let config = URLSessionConfiguration.default
        

        let session = URLSession(configuration: config)

        
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                defer {
                    print("Fim da requisição!")
                    DispatchQueue.main.async(execute: {
                        self.Delegate.OnFinishSendMessage()
                    })
                }

                guard error == nil else {
                    self.OnError("Erro ao processar requisição.", errorCallback: errorCallback)
                    print(error!)
                    return
                }
                
                guard let responseData = data else {
                    self.OnError("Nenhum dado recebido da requisição.", errorCallback: errorCallback)
                    return
                }
            
                //let responseString = NSString(data: responseData, encoding: NSUTF8StringEncoding)
            
                do {
                    self.Result = try JSONSerialization.jsonObject(with: responseData,
                        options: []) as! NSDictionary
                    
                    DispatchQueue.main.async(execute: {
                        successCallback(self.Result)
                    })
                    
                    
                } catch  {
                    self.OnError("Ocorreu um erro ao transformar a resposta de JSON para objeto.", errorCallback: errorCallback)
                    return
                }
        })

        task.resume()
        
    }
    
    fileprivate func OnError(_ error: String!, errorCallback: @escaping ((String) -> Void)){
        DispatchQueue.main.async(execute: {
            print(error)
            self.Delegate.OnFinishSendMessage()
            errorCallback(error)
        })
    }
}
