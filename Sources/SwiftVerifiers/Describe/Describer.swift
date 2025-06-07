// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

class Describer {
    var next: Describer?
    init(next: Describer? = nil) {
        self.next = next
    }
    func handle(_ value: Any) -> String {
        if willHandle(value) {
            return describe(value)
        } else if let next = next {
            return next.handle(value)
        } else {
            return "" // Fallback if no handler processes the value
        }
    }
    func willHandle(_ value: Any) -> Bool {
        fatalError("Subclasses must override willHandle(_:)")
    }
    func describe(_ value: Any) -> String {
        fatalError("Subclasses must override describe(_:)")
    }
}
