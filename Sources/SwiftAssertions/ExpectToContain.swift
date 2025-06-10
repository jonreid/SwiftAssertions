// SwiftAssertions by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftAssertions/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

/// Verifies that actual sequence contains expected element.
/// Otherwise it reports the actual sequence in a test failure.
/// Works with Swift Testing or XCTest.
public func expectToContain<Actual: Sequence>(
    _ actual: Actual,
    expected: Actual.Element,
    message: String? = nil,
    fileID: String = #fileID,
    filePath: StaticString = #filePath,
    line: UInt = #line,
    column: UInt = #column,
    failure: any Failing = Fail()
) where Actual.Element: Equatable {
    if actual.contains(expected) { return }
    failure.fail(
        message: "Expected to contain \(describe(expected)), but was \(describe(actual))" + messageSuffix(message),
        location: SourceLocation(fileID: fileID, filePath: filePath, line: line, column: column)
    )
}

/// Verifies that actual string contains expected substring.
/// Otherwise it reports the actual string in a test failure.
/// Works with Swift Testing or XCTest.
public func expectToContain(
    _ actual: String,
    expected: String,
    message: String? = nil,
    fileID: String = #fileID,
    filePath: StaticString = #filePath,
    line: UInt = #line,
    column: UInt = #column,
    failure: any Failing = Fail()
) {
    if actual.contains(expected) { return }
    failure.fail(
        message: "Expected to contain \(describe(expected)), but was \(describe(actual))" + messageSuffix(message),
        location: SourceLocation(fileID: fileID, filePath: filePath, line: line, column: column)
    )
} 
