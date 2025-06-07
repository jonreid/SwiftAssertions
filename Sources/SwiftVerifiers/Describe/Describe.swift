// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

private enum DescriberChain {
    static let chain: Describer = {
        let fallback = FallbackDescriber()
        let stringHandler = StringDescriber(successor: fallback)
        let optionalHandler = OptionalDescriber(successor: stringHandler)
        return optionalHandler
    }()
}

public func describe(_ value: Any) -> String {
    return DescriberChain.chain.handle(value)
}
