// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

public func describeMismatch<T>(_ type: T.Type, expected: T, actual: T, message: String? = nil) -> String {
    let message = message.map { " - \($0)" } ?? ""
    return "Expected \(describe(type, value: expected)), but was \(describe(type, value: actual))\(message)"
}
