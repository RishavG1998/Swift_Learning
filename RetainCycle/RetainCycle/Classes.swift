//
//  Classes.swift
//  RetainCycle
//
//  Created by Rishav Gupta on 03/06/24.
//

import Foundation

class Person {
    var name: String
    var macBook: MacBook?
    
    init(name: String, macBook: MacBook? = nil) {
        self.name = name
        self.macBook = macBook
    }
    
    deinit {
        print("\(name) is being de-initialized")
    }
}

class MacBook {
    var name: String
    weak var owner: Person?
    
    init(name: String, owner: Person? = nil) {
        self.name = name
        self.owner = owner
    }
    
    deinit {
        print("MacBook named \(name) is being de-initialized")
    }
}
