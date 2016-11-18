//
//  Auth.swift
//  seugarcom
//
//  Created by Alysson Nazareth on 23/03/16.
//  Copyright © 2016 RAH. All rights reserved.
//

import Foundation

protocol AuthDelegate : ApiDelegate {
    func OnAuthSuccess(_ user: User!) -> Void
    func OnAuthError(_ error: String!) -> Void
    func OnRegisterSuccess(_ user: User!) -> Void
    func OnRegisterError(_ error: String!) -> Void
}

class Auth : Api<AuthDelegate> {
    
    override init(){
        super.init()
        Route = "Auth"
    }
    
    func Auth(_ username: String, password: String){
        let msg = CreateMessage()
        msg.AddParameter("username", value: username)
        msg.AddParameter("password", value: password)
        msg.Send(SuccessAuth, errorCallback: Delegate.OnAuthError)
    }
        
    fileprivate func SuccessAuth(_ result: NSDictionary!){
        if (result["token"] == nil)
        {
            Delegate.OnAuthError(result["error"] as! String!)
            return
        }
        
        let user = User()
        Delegate.OnAuthSuccess(user)
    }
    
    func Register(_ username: String, password: String, email: String){
        let msg = CreateMessage("register")
        msg.AddParameter("username", value: username)
        msg.AddParameter("password", value: password)
        msg.AddParameter("email", value: email)
        msg.Send(SuccessAuth, errorCallback: Delegate.OnAuthError)
    }
}
