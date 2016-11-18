//
//  ApiBase.swift
//  seugarcom
//
//  Created by Alysson Nazareth on 23/03/16.
//  Copyright © 2016 RAH. All rights reserved.
//

import Foundation

protocol ApiDelegate : ProtocolDelegate {
    
}

class Api<TWDelegateProtocol> {
    var Url : String = SettingsManager.get("RAH.Host")
    var Route : String!
    var Delegate: TWDelegateProtocol!
    
    init(){
        
    }
    
    func CreateMessage() -> Protocol {
        return CreateMessage("")
    }
    
    func CreateMessage(_ action: String) -> Protocol {
        let msg = Protocol()
        msg.Delegate = Delegate as? ProtocolDelegate
        msg.Url = BuildAction(action)
        return msg;
    }
    
    fileprivate func BuildAction(_ action: String) -> String{
        return SettingsManager.get("RAH.Host") + "api/\(Route)/\(action)"
    }
}
