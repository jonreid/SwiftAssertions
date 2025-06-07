// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

import SwiftVerifiers
import Testing

final class DescribeMismatchTests: @unchecked Sendable {
    @Test
    func describeMismatch_forString() throws {
        let message = describeMismatch(String.self, actual: "def", expected: "abc")
        #expect(message == #"Expected "abc", but was "def""#)
    }

    @Test
    func describeMismatch_forInt() throws {
        let message = describeMismatch(Int.self, actual: 1, expected: 0)
        #expect(message == "Expected 0, but was 1")
    }

    @Test
    func describeMismatch_forOptionalInt() throws {
        let message = describeMismatch(Int?.self, actual: nil, expected: 3)
        #expect(message == "Expected 3, but was nil")
    }

    @Test
    func describeStringWithQuotes_enclosesInQuotes_escapingBackslashAndQuote() throws {
        #expect(describe("a\"b") == #""a\"b""#)
    }

    @Test
    func describeStringWithNewline_enclosesInQuotes_escapingBackslash() throws {
        #expect(describe("a\nb") == #""a\nb""#)
    }

    @Test
    func describeStringWithCarriageReturn_enclosesInQuotes_escapingBackslash() throws {
        #expect(describe("a\rb") == #""a\rb""#)
    }

    @Test
    func describeStringWithTab_enclosesInQuotes_escapingBackslash() throws {
        #expect(describe("a\tb") == #""a\tb""#)
    }
}
