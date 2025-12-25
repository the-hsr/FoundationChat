//
//  ChatViewModel.swift
//  FoundationChat
//
//  Created by Himanshu Singh on 25/12/25.
//

import SwiftUI
import Combine

@MainActor
final class ChatViewModel: ObservableObject {

    @Published var messages: [ChatMessage] = []
    @Published var isLoading = false

    private let llm: LLMClient

    init(llm: LLMClient) {
        self.llm = llm
    }

    convenience init() {
        self.init(llm: LocalLLMService())
    }

    func send(_ text: String) {
        messages.append(ChatMessage(text: text, isUser: true))

        Task {
            isLoading = true
            do {
                let reply = try await llm.send(message: text)
                messages.append(ChatMessage(text: reply, isUser: false))
            } catch {
                messages.append(
                    ChatMessage(text: "❌ Failed to generate response.", isUser: false)
                )
            }
            isLoading = false
        }
    }
}

