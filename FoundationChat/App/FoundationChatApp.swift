//
//  FoundationChatApp.swift
//  FoundationChat
//
//  Created by Himanshu Singh on 25/12/25.
//

import SwiftUI

@main
struct FoundationChatApp: App {
    private let coordinator = ChatCoordinator()

    var body: some Scene {
        WindowGroup {
            coordinator.start()
                .preferredColorScheme(.light)
        }
    }
}
