//
//  PenCakeApp.swift
//  PenCake
//
//  Created by 남경민 on 2023/01/26.
//

import SwiftUI


// 첫 화면
@main
struct PenCakeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
