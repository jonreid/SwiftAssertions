// SwiftAssertions by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftAssertions/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

/// Verifies that actual object is equal to expected object, whether you're using Swift Testing or XCTest.
/// This is useful when writing your own test helpers.
public func expectToEqual<T: Equatable>(
    _ actual: T,
    expected: T,
    message: String? = nil,
    fileID: String = #fileID,
    filePath: StaticString = #filePath,
    line: UInt = #line,
    column: UInt = #column,
    failure: any Failing = Fail()
) {
    if actual == expected { return }
    failure.fail(
        message: "Expected \(describe(expected)), but was \(describe(actual))" + messageSuffix(message),
        location: SourceLocation(fileID: fileID, filePath: filePath, line: line, column: column)
    )
}
