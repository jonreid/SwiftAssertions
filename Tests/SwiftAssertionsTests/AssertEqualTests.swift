// SwiftAssertions by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftAssertions/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

import SwiftAssertions
import Testing

final class AssertEqualTests: @unchecked Sendable {
    private let failSpy = FailSpy()

    @Test
    func equal() async throws {
        expectToEqual(1, expected: 1, failure: failSpy)

        #expect(failSpy.callCount == 0)
    }

    @Test
    func mismatch() async throws {
        expectToEqual(2, expected: 1, failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected 1, but was 2")
    }

    @Test
    func mismatchStrings() async throws {
        expectToEqual("B", expected: "A", failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == #"Expected "A", but was "B""#)
    }

    @Test
    func mismatchWithMessage() async throws {
        expectToEqual(2, expected: 1, message: "message", failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected 1, but was 2 - message")
    }

    @Test
    func optionalEqual() async throws {
        let one: Int? = 1
        let two: Int? = 1

        expectToEqual(two, expected: one, failure: failSpy)

        #expect(failSpy.callCount == 0)
    }

    @Test
    func optionalBothNil() async throws {
        let one: Int? = nil
        let two: Int? = nil

        expectToEqual(two, expected: one, failure: failSpy)

        #expect(failSpy.callCount == 0)
    }

    @Test
    func mismatchOptionals() async throws {
        let one: Int? = 1
        let two: Int? = 2

        expectToEqual(two, expected: one, failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected 1, but was 2")
    }

    @Test
    func mismatchOptionalsWithExpectedNil() async throws {
        let one: Int? = nil
        let two: Int? = 2

        expectToEqual(two, expected: one, failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected nil, but was 2")
    }

    @Test
    func mismatchOptionalsWithActualNil() async throws {
        let one: Int? = 1
        let two: Int? = nil

        expectToEqual(two, expected: one, failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected 1, but was nil")
    }
}
