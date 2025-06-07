// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

public func describeMismatch<T>(actual: T, expected: T, message: String? = nil) -> String {
    "Expected \(describe(expected)), but was \(describe(actual))" + messageSuffix(message)
}

public func messageSuffix(_ message: String?) -> String {
    message.map { " - \($0)" } ?? ""
}
