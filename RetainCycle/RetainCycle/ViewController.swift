//
//  ViewController.swift
//  RetainCycle
//
//  Created by Rishav Gupta on 03/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    var person: Person?
    var macBook: MacBook?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createObjects()
        self.assignProperties()
    }
    
    func createObjects() {
        person = Person(name: "Rishi")
        macBook = MacBook(name: "M2Pro")
        
//        person = nil
//        macBook = nil
    }
    
    func assignProperties() {
        
        // Retain Cycle If Both strong
        person?.macBook = macBook
        macBook?.owner = person
        
        // deinit will not be called if the reference counter is not zero
        // i.e. if macBook?.owner is not weakly referencing to person
//        person = nil
        macBook = nil
        person = nil
    }

}

