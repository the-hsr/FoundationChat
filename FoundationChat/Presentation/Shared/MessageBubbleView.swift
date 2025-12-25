//
//  MessageBubbleView.swift
//  FoundationChat
//
//  Created by Himanshu Singh on 25/12/25.
//

import SwiftUI


struct MessageBubbleView: View {

    let message: ChatMessage

    var body: some View {
        HStack {
            if message.isUser { Spacer() }

            Text(message.text)
                .padding(12)
                .background(
                    message.isUser
                    ? Color.blue.opacity(0.2)
                    : Color.gray.opacity(0.2)
                )
                .cornerRadius(12)
                .frame(maxWidth: .infinity, alignment: message.isUser ? .trailing : .leading)

            if !message.isUser { Spacer() }
        }
    }
}
