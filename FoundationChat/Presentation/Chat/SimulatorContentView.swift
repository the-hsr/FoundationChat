//
//  SimulatorContentView.swift
//  FoundationChat
//
//  Created by Himanshu Singh on 25/12/25.
//

import SwiftUI

struct SimulatorContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "cpu")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.gray)

            Text("🚫 AI not supported in Simulator")
                .font(.headline)
                .multilineTextAlignment(.center)

            Text("On-device AI models and FoundationModels require a real device, as the Simulator cannot download or host Apple Intelligence model assets.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

#Preview {
    SimulatorContentView()
}
