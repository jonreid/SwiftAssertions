// SwiftVerifiers by Jon Reid, https://qualitycoding.org
// Copyright 2025 Jonathan M. Reid. https://github.com/jonreid/SwiftVerifiers/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

/// Verifies that actual object is of the expected type, returning downcast instance if successful.
/// Otherwise, it fails the test reporting the actual type, and returns nil.
@discardableResult
public func verifyType<BaseClass, Specific>(
    _ actual: BaseClass?,
    expectedType: Specific.Type,
    message: String? = nil,
    fileID: String = #fileID,
    filePath: StaticString = #filePath,
    line: UInt = #line,
    column: UInt = #column,
    failure: any Failing = Fail()
) -> Specific? {
    guard let actual else {
        failure.fail(
            message: "Expected \(Specific.self), but was nil" + messageSuffix(message),
            location: SourceLocation(fileID: fileID, filePath: filePath, line: line, column: column)
        )
        return nil
    }
    guard let typed = actual as? Specific else {
        failure.fail(
            message: "Expected \(Specific.self), but was \(describe(actual))" + messageSuffix(message),
            location: SourceLocation(fileID: fileID, filePath: filePath, line: line, column: column)
        )
        return nil
    }
    return typed
}
