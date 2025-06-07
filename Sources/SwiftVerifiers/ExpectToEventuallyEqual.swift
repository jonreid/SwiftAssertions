// ExpectToEventuallyEqual by Jon Reid (https://qualitycoding.org) and Steven Baker (https://stevenrbaker.com)
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

import Foundation

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func expectToEventuallyEqual<T: Equatable & Sendable>(
    actual: () async throws -> T,
    expected: T,
    timeout: TimeInterval = 1.0,
    message: String? = nil,
    fileID: String = #fileID,
    filePath: StaticString = #filePath,
    line: UInt = #line,
    column: UInt = #column,
    failure: Failing = Fail()
) async throws {
    let timeoutDate = Date(timeIntervalSinceNow: timeout)

    var lastActual = try await actual()
    var tryCount = 0
    repeat {
        tryCount += 1
        if lastActual == expected {
            return
        }
        try await Task.sleep(nanoseconds: 10_000_000)
        lastActual = try await actual()
    } while Date().compare(timeoutDate) == .orderedAscending

    failure.fail(
        message: "Expected \(describe(expected)), but was \(describe(lastActual)) after \(tryCount) tries, timing out after \(timeout) seconds" + messageSuffix(message),
        location: SourceLocation(fileID: fileID, filePath: filePath, line: line, column: column)
    )
}
