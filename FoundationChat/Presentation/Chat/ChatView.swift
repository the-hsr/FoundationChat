//
//  ChatView.swift
//  FoundationChat
//
//  Created by Himanshu Singh on 25/12/25.
//

import SwiftUI

struct ChatView: View {

    @StateObject var viewModel: ChatViewModel
    @State private var inputText = ""

    var body: some View {
        if DeviceChecker.isSimulator {
            SimulatorContentView()
        } else {
            mainApp
        }
    }
}

extension ChatView {
    private var mainApp: some View {
        VStack(spacing: 0) {
            titleBar

            Divider()

            messageContent

            inputBar
        }
        .background(Image("background"))
    }

    private var titleBar: some View {
        HStack(spacing: 12) {
            Spacer()

            Image(systemName: "brain.head.profile")
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 28)
                .foregroundColor(.blue)

            Text("FoundationChat")
                .font(.headline)
                .foregroundColor(.primary)

            Spacer()
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 2)
    }

    private var messageContent: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        MessageBubbleView(message: message)
                            .id(message.id)
                            .padding(12)
                    }

                        if viewModel.isLoading {
                            HStack {
                                TypingIndicatorView()
                                    .padding(12)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(12)
                                    .frame(maxWidth: 80, alignment: .leading)
                                    .padding(.leading)
                                
                                Spacer()
                            }
                        }
                }
            }
            .onChange(of: viewModel.messages.count) { oldValue, newValue in
                guard newValue != oldValue else { return }
                scrollToBottom(proxy)
            }
        }
    }

    private var inputBar: some View {
        HStack(spacing: 8) {
            inputField

            sendButton
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .padding()
    }

    private var inputField: some View {
        TextField("Ask something…", text: $inputText)
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(UIColor.systemGray6))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
            .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 1)
    }

    private var sendButton: some View {
        Button(action: {
            viewModel.send(inputText)
            inputText = ""
        }) {
            Image(systemName: "paperplane.fill")
                .foregroundColor(.white)
                .padding(12)
                .background(Color.blue)
                .clipShape(Circle())
                .shadow(color: Color.blue.opacity(0.4), radius: 2, x: 0, y: 2)
        }
        .disabled(inputText.isEmpty || viewModel.isLoading)
        .opacity(inputText.isEmpty ? 0.5 : 1.0)
    }

    private func scrollToBottom(_ proxy: ScrollViewProxy) {
        guard let lastID = viewModel.messages.last?.id else { return }

        withAnimation(.easeOut(duration: 0.25)) {
            proxy.scrollTo(lastID, anchor: .bottom)
        }
    }
}

#Preview {
    ChatView(
        viewModel: ChatViewModel()
    )
}
