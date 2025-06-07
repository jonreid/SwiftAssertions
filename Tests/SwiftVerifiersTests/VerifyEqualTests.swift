// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

import SwiftVerifiers
import Testing

final class VerifyEqualTests: @unchecked Sendable {
    private let failSpy = FailSpy()

    @Test
    func equal() async throws {
        verifyEqual(1, expected: 1, failure: failSpy)

        #expect(failSpy.callCount == 0)
    }

    @Test
    func mismatch() async throws {
        verifyEqual(2, expected: 1, failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected 1, but was 2")
    }

    @Test
    func mismatchStrings() async throws {
        verifyEqual("B", expected: "A", failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == #"Expected "A", but was "B""#)
    }

    @Test
    func mismatchMessage() async throws {
        verifyEqual(2, expected: 1, message: "message", failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected 1, but was 2 - message")
    }

    @Test
    func optionalEqual() async throws {
        let one: Int? = 1
        let two: Int? = 1

        verifyEqual(two, expected: one, failure: failSpy)

        #expect(failSpy.callCount == 0)
    }

    @Test
    func optionalBothNil() async throws {
        let one: Int? = nil
        let two: Int? = nil

        verifyEqual(two, expected: one, failure: failSpy)

        #expect(failSpy.callCount == 0)
    }

    @Test
    func optionalWithDifferentValues() async throws {
        let one: Int? = 1
        let two: Int? = 2

        verifyEqual(two, expected: one, failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected 1, but was 2")
    }

    @Test
    func optionalWithExpectedNil() async throws {
        let one: Int? = nil
        let two: Int? = 2

        verifyEqual(two, expected: one, failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected nil, but was 2")
    }

    @Test
    func optionalWithActualNil() async throws {
        let one: Int? = 1
        let two: Int? = nil

        verifyEqual(two, expected: one, failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected 1, but was nil")
    }
}
