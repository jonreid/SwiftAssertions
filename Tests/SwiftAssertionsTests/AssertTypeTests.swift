// SwiftAssertions by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftAssertions/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

import SwiftAssertions
import Testing

class Animal {}
final class Cat: Animal {}
final class Dog: Animal {}

final class AssertTypeTests: @unchecked Sendable {
    private let failSpy = FailSpy()

    @Test
    func correctType() async throws {
        let cat: Animal = Cat()

        let result = expectType(cat, expectedType: Cat.self, failure: failSpy)

        #expect(result != nil)
        #expect(failSpy.callCount == 0)
    }

    @Test
    func incorrectType() async throws {
        let dog: Animal = Dog()

        let result = expectType(dog, expectedType: Cat.self, failure: failSpy)

        #expect(result == nil)
        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected Cat, but was SwiftAssertionsTests.Dog")
    }

    @Test
    func incorrectTypeWithMessage() async throws {
        let dog: Animal = Dog()

        let result = expectType(dog, expectedType: Cat.self, message: "message", failure: failSpy)

        #expect(result == nil)
        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected Cat, but was SwiftAssertionsTests.Dog - message")
    }

    @Test
    func nilFails() async throws {
        let animal: Animal? = nil

        let result = expectType(animal, expectedType: Cat.self, failure: failSpy)

        #expect(result == nil)
        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected Cat, but was nil")
    }

    @Test
    func nilFailsWithMessage() async throws {
        let animal: Animal? = nil

        let result = expectType(animal, expectedType: Cat.self, message: "message", failure: failSpy)

        #expect(result == nil)
        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected Cat, but was nil - message")
    }
}
