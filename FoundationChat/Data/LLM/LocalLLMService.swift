//
//  LocalLLMService.swift
//  FoundationChat
//
//  Created by Himanshu Singh on 25/12/25.
//

import Foundation
import FoundationModels

final class LocalLLMService: StreamingLLMClient {

    private let session = LanguageModelSession()

    func send(message: String) async throws -> String {
        let response = try await session.respond(to: message)
        return response.content
    }

    func stream(
        message: String,
        onToken: @escaping (String) -> Void
    ) async throws {

        var lastEmitted = ""

        for try await snapshot in session.streamResponse(to: message) {
            let fullText = snapshot.content

            let newPart = String(fullText.dropFirst(lastEmitted.count))
            lastEmitted = fullText

            onToken(newPart)
        }
    }
}
