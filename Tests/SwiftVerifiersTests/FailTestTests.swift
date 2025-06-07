// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

import SwiftVerifiers
import Testing

final class FailTestTests: @unchecked Sendable {
    private let failSpy = FailSpy()

    @Test
    func failWorks() async throws {
        failTest("message", failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "message")
    }
}
