//
//  Controller.swift
//  Poke
//
//  Created by Michael Kantor on 2/25/15.
//  Copyright (c) 2015 Poke Ninja. All rights reserved.
//

import Foundation

#if (os(iOS))
    import UIKit
#else
    import AppKit
#endif

class Controller{
    
    static func getCurrentController() -> UIViewController {
        var current  = UIApplication.sharedApplication().keyWindow!.rootViewController!
        if let c = current.presentedViewController {
            current = c
        }
        if let q = current as? UINavigationController{
            println("IS NAV..")
            let vc: AnyObject  = q.viewControllers[0]
                current = q.viewControllers.first! as! UIViewController
        }
        return current
    }


    static func getNavigationController() -> UINavigationController?{
        var current  = UIApplication.sharedApplication().keyWindow!.rootViewController!
        if let q = current as? UINavigationController{
            return q
        }
        println("No navigation controller found..")
        return nil
    }
    

}