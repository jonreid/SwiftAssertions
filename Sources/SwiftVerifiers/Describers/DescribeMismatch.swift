// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

public func describeMismatch<T>(_ type: T.Type, actual: T, expected: T, message: String? = nil) -> String {
    let message = message.map { " - \($0)" } ?? ""
    return "Expected \(describe(expected)), but was \(describe(actual))\(message)"
}
