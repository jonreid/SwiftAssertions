// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

public func verifyEqual<T: Equatable>(
    actual: T,
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
        message: describeMismatch(T.self, actual: actual, expected: expected, message: message),
        location: SourceLocation(fileID: fileID, filePath: filePath, line: line, column: column)
    )
}
