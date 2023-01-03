//
//  CoreDataUIApp.swift
//  CoreDataUI
//
//  Created by Wallace Wang on 10/9/21.
//

import SwiftUI

@main
struct CoreDataUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
