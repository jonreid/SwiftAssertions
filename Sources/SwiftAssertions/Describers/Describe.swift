// SwiftAssertions by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftAssertions/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

public func describe(_ value: Any) -> String {
    return DescriberChain.head.handle(value)
}

private enum DescriberChain {
    static let head: Describer = {
        let fallback = FallbackDescriber()
        let stringHandler = StringDescriber(successor: fallback)
        let optionalHandler = OptionalDescriber(successor: stringHandler)
        return optionalHandler
    }()
}
