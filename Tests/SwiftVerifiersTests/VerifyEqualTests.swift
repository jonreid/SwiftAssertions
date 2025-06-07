import SwiftVerifiers
import Testing

final class VerifyEqualTests: @unchecked Sendable {
    private let failSpy = FailSpy()

    @Test
    func equal() async throws {
        verifyEqual(expected: 1, actual: 1, failure: failSpy)

        #expect(failSpy.callCount == 0)
    }

    @Test
    func mismatch() async throws {
        verifyEqual(expected: 1, actual: 2, failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected 1, but was 2")
    }

    @Test
    func mismatchStrings() async throws {
        verifyEqual(expected: "A", actual: "B", failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == #"Expected "A", but was "B""#)
    }

    @Test
    func mismatchMessage() async throws {
        verifyEqual(expected: 1, actual: 2, message: "message", failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected 1, but was 2 - message")
    }

    @Test
    func optionalWithBothValues() async throws {
        let one: Int? = 1
        let two: Int? = 2

        verifyEqual(expected: one, actual: two, failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected Optional(1), but was Optional(2)")
    }

    @Test
    func optionalWithExpectedNil() async throws {
        let one: Int? = nil
        let two: Int? = 2

        verifyEqual(expected: one, actual: two, failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected nil, but was Optional(2)")
    }

    @Test
    func optionalWithActualNil() async throws {
        let one: Int? = 1
        let two: Int? = nil

        verifyEqual(expected: one, actual: two, failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "Expected Optional(1), but was nil")
    }
}
