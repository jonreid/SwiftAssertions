// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

private class StringDescriber: Describer {
    override func willHandle(_ value: Any) -> Bool {
        value is String
    }
    override func describe(_ value: Any) -> String {
        toFormattedString(value as! String)
    }
}

private class FallbackDescribeHandler: Describer {
    override func willHandle(_ value: Any) -> Bool {
        true // Always handles if reached
    }
    override func describe(_ value: Any) -> String {
        String(describing: value)
    }
}

private var describerChain: Describer {
    let fallback = FallbackDescribeHandler()
    let stringHandler = StringDescriber(next: fallback)
    let optionalHandler = OptionalDescriber(next: stringHandler)
    return optionalHandler
}

public func describe(_ value: Any) -> String {
    return describerChain.handle(value)
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
