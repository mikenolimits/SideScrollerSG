//
//  Model.swift
//  Poke
//
//  Created by Michael Kantor on 2/26/15.
//  Copyright (c) 2015 Poke Ninja. All rights reserved.
//

import Foundation

class Model{
    
    var events = Container.app.get("events") as! Events
    typealias closure = () -> Void
    
    var getAll : closure?
    var find   : closure?
    
    func hasMany<T>(model: T) {
        
    }
    
    func belongsTo<T>(model : T){
        
    }
    
    
    var reloaded = false
    var maxPages = 1
    
    var pages: [Int] = [] {
        willSet(newValue) {
            if (!pages.contains(currentPage)) {
                getCollection()
                
                events.fire("modelRetrieved")
            }
        }
        didSet {
            pages = pages.unique()
        }
    }
    
    
    var currentPage: Int = 1 {
        didSet {
            if currentPage <= 0 {
                currentPage = 1
            }
            if currentPage > maxPages {
                currentPage = maxPages
            }
        }
    }
    
    var totalItems: NSMutableDictionary = [1: 0]
    
    init() {

        events.listenFor("requestModel", handler : { (event) in
            self.getCollection()
        })
        
        
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: "didRequestModel:", name: "requestModel", object: nil)
        
        reloadModel()
    }
    
    
    func didRequestModel(notification: NSNotification) {
        self.getCollection()
    }
    
    
    func getCollection() {
        
        if let all = getAll{

            all()
            
        }
    }
    
    
    func reloadModel() {
        
        let reachability = Container.app.get("reachability") as? Reachability
        if let r = reachability {
            if(r.isConnected()) {
                Async.background(after: 400.0) {
                    self.getCollection()
                    self.reloadModel()
                }
            }
        }else{
            reloadModel()
        }
    }
    
    
    func find(something: String) -> [AnyObject]? {
        return ["i"]
    }

}

