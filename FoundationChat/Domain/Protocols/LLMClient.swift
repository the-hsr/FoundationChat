//
//  LLMClient.swift
//  FoundationChat
//
//  Created by Himanshu Singh on 25/12/25.
//

import Foundation

public protocol LLMClient {
    func send(message: String) async throws -> String
}
