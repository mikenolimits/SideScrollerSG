//
// Created by Michael Kantor on 2/13/15.
// Copyright (c) 2015 Poke Ninja. All rights reserved.
//

import Foundation

class Event {

    typealias handler = (event : Event) -> ()

    var name           : String?

    var namespace      : String?
    
    var lastFiredAt    : Int?
    
    var data           : [String : AnyObject]?

    var callback       : handler?

    let reoccuring     : Bool
    
    func handle(){

        lastFiredAt = Int(NSDate().timeIntervalSince1970)
        callback!(event: self)

    }

    init(name : String,isReoccuring : Bool = true, namespace : String = "global"){
        self.name            = name
        self.reoccuring      = isReoccuring
        self.namespace       = namespace
    }

}
