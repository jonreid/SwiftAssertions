// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

private var describerChain: Describer {
    let fallback = FallbackDescriber()
    let stringHandler = StringDescriber(next: fallback)
    let optionalHandler = OptionalDescriber(next: stringHandler)
    return optionalHandler
}

public func describe(_ value: Any) -> String {
    return describerChain.handle(value)
}
