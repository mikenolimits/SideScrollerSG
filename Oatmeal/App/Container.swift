//
//  IoC.swift
//  Poke
//
//  Created by Michael Kantor on 12/1/14.
//  Copyright (c) 2014 Poke Ninja. All rights reserved.
//

import Foundation


class Container {

    static let App = Container()

    private var defaultMembers :  [String : Any] = ["events" : Events()]

    private var members: [String:Any] = [String: Any]() {
        didSet {
            println(members)
        }
    }

    var currentId = ""

    enum application {
        case Active
        case Inactive
    }

    var status: application = .Active

    init() {

        setDefaultMembers()
    }

    func bind(name: String, provides: Any) {
        println("binding\(provides)")
        members[name] = provides
    }

    func get(key: String) -> Any {
        if let member = members[key] {
            return member
        } else {
            fatalError("Member does not exist in container.")
        }
    }

    func setDefaultMembers(){
        defaultMembers.each { key, value in
            self.bind(key,provides:value)
        }
    }

}