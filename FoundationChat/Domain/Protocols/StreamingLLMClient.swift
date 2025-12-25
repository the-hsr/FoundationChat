//
//  StreamingLLMClient.swift
//  FoundationChat
//
//  Created by Himanshu Singh on 25/12/25.
//

import Foundation

public protocol StreamingLLMClient: LLMClient {
    func stream(
        message: String,
        onToken: @escaping (String) -> Void
    ) async throws
}
