// SwiftAssertions by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftAssertions/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

import SwiftAssertions
import Testing

final class AssertContainsTests: @unchecked Sendable {
    private let failSpy = FailSpy()

    @Test
    func arrayContainsValue() async throws {
        expectToContain([1, 2, 3], expected: 2, failure: failSpy)

        #expect(failSpy.callCount == 0)
    }

    @Test
    func arrayDoesNotContainValue() async throws {
        expectToContain([1, 2, 3], expected: 4, failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected to contain 4, but was [1, 2, 3]")
    }

    @Test
    func arrayDoesNotContainValueWithMessage() async throws {
        expectToContain([1, 2, 3], expected: 4, message: "message", failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected to contain 4, but was [1, 2, 3] - message")
    }

    @Test
    func stringContainsSubstring() async throws {
        assertContains("hello", expected: "ell", failure: failSpy)

        #expect(failSpy.callCount == 0)
    }

    @Test
    func stringDoesContainSubstring() async throws {
        assertContains("hello", expected: "world", failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == #"Expected to contain "world", but was "hello""#)
    }

    @Test
    func stringDoesContainSubstringWithMessage() async throws {
        assertContains("hello", expected: "world", message: "message", failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == #"Expected to contain "world", but was "hello" - message"#)
    }
}
