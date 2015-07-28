//
// Created by Michael Kantor on 2/13/15.
// Copyright (c) 2015 Poke Ninja. All rights reserved.
//

import Foundation

//Closure Based Events Bound to the container of the IoC. 

class Events {
    
    private lazy var globalListeners = [String : Event]()

    private lazy var localListeners  = [String : Event]()
    
    /*
        Bind a new event to the IoC
      */
    func listenFor(event : String, global : Bool = true, handler : (event : Event) -> Void){

        let e      = Event(name : event)
        
        e.callback = { (event : Event) -> () in
            e.lastFiredAt = Int(NSDate().timeIntervalSince1970)
            handler(event: e)
        }

        //If the directive is not global, then we make the assumption that the event
        //is only to be resolved if the controller is the same as the one the event 
        //was created in

        if(global){

           globalListeners[event] = e

        }else {
            //Reflect the currently used controller and gets it objectId
            if let className = getNamespace() {
                println("The Clas Name is \(className)")
                e.namespace = "\(className)"
                localListeners[event] = e
            }
        }
    }


    func dispose(event : String){
        globalListeners.removeValueForKey(event)
        localListeners.removeValueForKey(event)
    }

    
    func flush(){
        
        //Loop through the current controllers events & "flush" them
        if let className = getNamespace(){
            for (key,value) in localListeners{
                if className == value.namespace!{
                    localListeners.removeValueForKey(key)
                }
            }
        }
        
    }
    
    
    func getNamespace()->String?{
        
        let current              = Controller.getCurrentController()
        let className            = reflect(current).valueType

        
        return toString(className)
    }

    func fire(event : String,
              object : [String : AnyObject]? = nil) -> (Bool,Event?){


        if let e = globalListeners[event]{

            if let data = object{

                e.data = data
            }

            e.callback!(event: e)
        }else if let e = localListeners[event]{
            
            let className = getNamespace()
            
            if let name = className{
                if e.namespace == toString(name){

                    if let data = object{

                        e.data = data
                    }
                    
                    e.callback!(event : e)
                    return (true,e)
                }else{
                    return (false,e)
                }
            }
        }
        println("Event Does Not Exist.")
            
        return (false,nil)
    }

}
