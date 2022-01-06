//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by David Zhao on 03/01/2022.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
