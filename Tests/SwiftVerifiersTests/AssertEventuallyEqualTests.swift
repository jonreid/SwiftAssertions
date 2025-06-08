// ExpectToEventuallyEqual by Jon Reid (https://qualitycoding.org) and Steven Baker (https://stevenrbaker.com)
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

import SwiftVerifiers
import Testing

final class AssertEventuallyEqualTests: @unchecked Sendable {
    let failSpy = FailSpy()

    @Test
    func test_immediateMatch() async throws {
        try await assertEventuallyEqual(actual: { "abc" }, expected: "abc", failure: failSpy)

        #expect(failSpy.callCount == 0)
    }

    @Test
    func eventualMatch() async throws {
        let changeling = Changeling(beforeChange: "nope")

        try await assertEventuallyEqual(
            actual: { changeling.tryAgain(returning: "eventually", after: 5) },
            expected: "eventually",
            failure: failSpy
        )

        #expect(failSpy.callCount == 0)
    }

    @Test
    func failure() async throws {
        let changeling = Changeling(beforeChange: "nope")

        try await assertEventuallyEqual(
            actual: { changeling.tryAgain(returning: "never", after: 5) },
            expected: "eventually",
            timeout: 0.1,
            failure: failSpy
        )

        #expect(failSpy.callCount == 1)
        let message = try #require(failSpy.messages.first)
        #expect(message.hasPrefix("Expected \"eventually\", but was \"never\" after "), Comment(rawValue: message))
        #expect(message.hasSuffix(" tries, timing out after 0.1 seconds"), Comment(rawValue: message))
        let location = try #require(failSpy.locations.first)
        #expect("\(location.filePath)".hasSuffix("/AssertEventuallyEqualTests.swift"), Comment(rawValue: "file"))
        #expect(location.line == 35, Comment(rawValue: "line"))
    }

    @Test
    func failureWithMessage() async throws {
        let changeling = Changeling(beforeChange: "nope")

        try await assertEventuallyEqual(
            actual: { changeling.tryAgain(returning: "never", after: 5) },
            expected: "eventually",
            timeout: 0.1,
            message: "message",
            failure: failSpy
        )

        #expect(failSpy.callCount == 1)
        let message = try #require(failSpy.messages.first)
        #expect(message.hasSuffix(" tries, timing out after 0.1 seconds - message"), Comment(rawValue: message))
    }
}

private final class Changeling<T> {
    private let beforeChange: T
    private var tries = 0

    init(beforeChange: T) {
        self.beforeChange = beforeChange
    }

    func tryAgain(returning afterChange: T, after: Int) -> T {
        guard tries < after else {
            return afterChange
        }
        tries += 1
        return beforeChange
    }
}
