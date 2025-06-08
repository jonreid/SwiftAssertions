// SwiftAssertions by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftAssertions/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

import SwiftAssertions
import Testing

final class DescribeTests: @unchecked Sendable {
    @Test
    func stringWithQuote() throws {
        #expect(describe("a\"b") == #""a\"b""#)
    }

    @Test
    func stringWithNewline() throws {
        #expect(describe("a\nb") == #""a\nb""#)
    }

    @Test
    func stringWithCarriageReturn() throws {
        #expect(describe("a\rb") == #""a\rb""#)
    }

    @Test
    func stringWithTab() throws {
        #expect(describe("a\tb") == #""a\tb""#)
    }
}
