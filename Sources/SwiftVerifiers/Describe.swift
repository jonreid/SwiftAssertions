// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

public func describe<T>(_ type: T.Type, value: T) -> String {
    let description = String(describing: value)
    if type == String.self {
        return toFormattedString(description)
    }
    return description
}

private func toFormattedString(_ unformatted: String) -> String {
    let formattedChars = unformatted.map { escapeSpecialCharacter($0) }
    return "\"\(formattedChars.joined())\""
}

private func escapeSpecialCharacter(_ char: Character) -> String {
    switch char {
    case "\"":
        return "\\\""
    case "\n":
        return "\\n"
    case "\r":
        return "\\r"
    case "\t":
        return "\\t"
    default:
        return String(char)
    }
}
