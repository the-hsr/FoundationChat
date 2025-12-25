//
//  TypingIndicatorView.swift
//  FoundationChat
//
//  Created by Himanshu Singh on 25/12/25.
//

import SwiftUI

struct TypingIndicatorView: View {
    @State private var scale: [Bool] = [false, false, false]

    let dotSize: CGFloat = 8
    let spacing: CGFloat = 6

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<3) { index in
                Circle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: dotSize, height: dotSize)
                    .scaleEffect(scale[index] ? 1 : 0.5)
                    .animation(
                        .easeInOut(duration: 0.6)
                            .repeatForever()
                            .delay(Double(index) * 0.2),
                        value: scale[index]
                    )
            }
        }
        .onAppear {
            for i in 0..<3 { scale[i] = true }
        }
    }
}
