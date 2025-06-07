// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

private class Describer {
    var next: Describer?
    init(next: Describer? = nil) {
        self.next = next
    }
    func handle(_ value: Any) -> String {
        if willHandle(value) {
            return executeHandling(value)
        } else if let next = next {
            return next.handle(value)
        } else {
            return "" // Fallback if no handler processes the value
        }
    }
    func willHandle(_ value: Any) -> Bool {
        fatalError("Subclasses must override willHandle(_:)")
    }
    func executeHandling(_ value: Any) -> String {
        fatalError("Subclasses must override executeHandling(_:)")
    }
}

private class OptionalDescriber: Describer {
    override func willHandle(_ value: Any) -> Bool {
        Mirror(reflecting: value).displayStyle == .optional
    }
    override func executeHandling(_ value: Any) -> String {
        let mirror = Mirror(reflecting: value)
        if mirror.children.count == 0 {
            return "nil"
        } else if let child = mirror.children.first {
            return String(describing: child.value)
        }
        return ""
    }
}

private class StringDescribeHandler: Describer {
    override func willHandle(_ value: Any) -> Bool {
        value is String
    }
    override func executeHandling(_ value: Any) -> String {
        toFormattedString(value as! String)
    }
}

private class FallbackDescribeHandler: Describer {
    override func willHandle(_ value: Any) -> Bool {
        true // Always handles if reached
    }
    override func executeHandling(_ value: Any) -> String {
        String(describing: value)
    }
}

public func describe(_ value: Any) -> String {
    let fallback = FallbackDescribeHandler()
    let stringHandler = StringDescribeHandler(next: fallback)
    let optionalHandler = OptionalDescriber(next: stringHandler)
    return optionalHandler.handle(value)
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
