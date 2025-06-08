// SwiftAssertions by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftAssertions/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

public final class FailSpy: Failing {
    public private(set) var callCount = 0
    public private(set) var messages: [String] = []
    public private(set) var locations: [SourceLocation] = []

    public init() {}

    public func fail(message: String, location: SourceLocation) {
        callCount += 1
        self.messages.append(message)
        self.locations.append(location)
    }
}
