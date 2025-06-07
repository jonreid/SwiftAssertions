// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

import SwiftVerifiers
import Testing

final class DescribeTests: @unchecked Sendable {
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
