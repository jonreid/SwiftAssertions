// SwiftAssertions by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftAssertions/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

public func expectToContain<Actual: Sequence>(
    _ actual: Actual,
    expected: Actual.Element,
    message: String? = nil,
    fileID: String = #fileID,
    filePath: StaticString = #filePath,
    line: UInt = #line,
    column: UInt = #column,
    failure: any Failing = FailReal()
) where Actual.Element: Equatable {
    if actual.contains(expected) { return }
    failure.fail(
        message: "Expected to contain \(describe(expected)), but was \(describe(actual))" + messageSuffix(message),
        location: SourceLocation(fileID: fileID, filePath: filePath, line: line, column: column)
    )
}

public func assertContains(
    _ actual: String,
    expected: String,
    message: String? = nil,
    fileID: String = #fileID,
    filePath: StaticString = #filePath,
    line: UInt = #line,
    column: UInt = #column,
    failure: any Failing = FailReal()
) {
    if actual.contains(expected) { return }
    failure.fail(
        message: "Expected to contain \(describe(expected)), but was \(describe(actual))" + messageSuffix(message),
        location: SourceLocation(fileID: fileID, filePath: filePath, line: line, column: column)
    )
} 
