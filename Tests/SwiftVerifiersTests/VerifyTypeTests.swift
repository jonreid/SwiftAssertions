// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

import SwiftVerifiers
import Testing

class Animal {}
final class Cat: Animal {}
final class Dog: Animal {}


final class VerifyTypeTests: @unchecked Sendable {
    private let failSpy = FailSpy()

    @Test
    func correctType() async throws {
        let cat: Animal = Cat()

        let result = verifyType(cat, expectedType: Cat.self, failure: failSpy)

        #expect(result != nil)
        #expect(failSpy.callCount == 0)
    }

    @Test
    func incorrectType() async throws {
        let dog: Animal = Dog()

        let result = verifyType(dog, expectedType: Cat.self, failure: failSpy)

        #expect(result == nil)
        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected Cat, but was Optional(SwiftVerifiersTests.Dog)")
    }

    @Test
    func nilFails() async throws {
        let animal: Animal? = nil

        let result = verifyType(animal, expectedType: Cat.self, failure: failSpy)

        #expect(result == nil)
        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected Cat, but was nil")
    }
} 
