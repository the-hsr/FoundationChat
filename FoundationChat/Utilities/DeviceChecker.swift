//
//  DeviceChecker.swift
//  FoundationChat
//
//  Created by Himanshu Singh on 25/12/25.
//

import Foundation

struct DeviceChecker {
    static var isSimulator: Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }
}
