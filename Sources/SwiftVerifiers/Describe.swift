// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

public func describe(_ value: Any) -> String {
    let mirror = Mirror(reflecting: value)
    if mirror.displayStyle == .optional {
        if mirror.children.count == 0 {
            return "nil"
        } else if let child = mirror.children.first {
            return String(describing: child.value)
        }
    }
    if let stringValue = value as? String {
        return toFormattedString(stringValue)
    }
    return String(describing: value)
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
