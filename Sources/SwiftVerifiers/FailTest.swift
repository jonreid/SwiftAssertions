// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

public func fail(
    _ message: String,
    fileID: String = #fileID,
    filePath: StaticString = #filePath,
    line: UInt = #line,
    column: UInt = #column,
    failure: any Failing = FailReal()
) {
    failure.fail(
        message: message,
        location: SourceLocation(fileID: fileID, filePath: filePath, line: line, column: column)
    )
}
