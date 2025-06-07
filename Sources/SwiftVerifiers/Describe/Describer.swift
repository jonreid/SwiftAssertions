// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

class Describer {
    private let next: Describer?

    init(next: Describer? = nil) {
        self.next = next
    }

    func handle(_ value: Any) -> String {
        if willHandle(value) {
            return describe(value)
        }
        if let next {
            return next.handle(value)
        }
        return "error: no describer for value"
    }

    func willHandle(_ value: Any) -> Bool {
        fatalError("Subclasses must override willHandle(_:)")
    }

    func describe(_ value: Any) -> String {
        fatalError("Subclasses must override describe(_:)")
    }
}
