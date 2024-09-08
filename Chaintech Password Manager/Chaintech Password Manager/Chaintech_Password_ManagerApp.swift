//
//  Chaintech_Password_ManagerApp.swift
//  Chaintech Password Manager
//
//  Created by Rishav Gupta on 07/08/24.
//

import SwiftUI

@main
struct Chaintech_Password_ManagerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
