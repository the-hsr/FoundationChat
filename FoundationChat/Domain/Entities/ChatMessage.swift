//
//  ChatMessage.swift
//  FoundationChat
//
//  Created by Himanshu Singh on 25/12/25.
//

import Foundation

public struct ChatMessage: Identifiable {
    public let id = UUID()
    public let text: String
    public let isUser: Bool

    public init(text: String, isUser: Bool) {
        self.text = text
        self.isUser = isUser
    }
}
