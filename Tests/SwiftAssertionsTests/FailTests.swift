// SwiftAssertions by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftAssertions/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

import SwiftAssertions
import Testing

final class FailTests: @unchecked Sendable {
    private let failSpy = FailSpy()

    @Test
    func failWorks() async throws {
        reportFailure("message", failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "message")
    }
}
