//
//  weak_self.swift
//  LearningSwift
//
//  Created by Rishav Gupta on 03/06/24.
//

import Foundation

// Vincent Pradeilles YT
class WeakSelf {
    func format(_ value: Int) -> String {
        return "\(value)"
    }

    var handler: ((Int) -> Void)? = nil

    func code() {
//         1st example -> no [weak self] is needed
//         if closure is not annotated with escaping then we don't need weak self
//         as it is impossible to create a retain cycle with a non-escaping closure
//         let formatted = [1,2,3].map { [weak self] value in
//             return self?.format(value)
//         }
        let formatted = [1,2,3].map { value in
            return format(value)
        }
        print(formatted)
        
//        2nd example -> [weak self] is not mandatory
//                       but whether we usr it changes the behaviour
//        As the escaping closure only stays in the memory for a few seconds after now()
//        so we can remove weak self as it wouldn't create retain cycle
//        since once the closure has been executed the data is going to be removed from memory
//        but the following code will run differently with and without weak self
        
                                                            
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            let formatted = self?.format(25)
            print(formatted as Any)
        }
        
        // 3rd example -> [weak self] is needed
        // escaping closures that are stored indefinitely and these closures are
        // guaranteed to create retain cycles so weak self in mandatory
        handler = { [weak self] value in
            let formatted = self?.format(value)
            print(formatted as Any)
        }
    }
}


