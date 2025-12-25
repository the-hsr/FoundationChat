//
//  ChatCoordinator.swift
//  FoundationChat
//
//  Created by Himanshu Singh on 25/12/25.
//

import SwiftUI

final class ChatCoordinator {

    func start() -> some View {
        ChatView(
            viewModel: ChatViewModel()
        )
    }
}
