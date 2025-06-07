import SwiftVerifiers
import Testing

final class FailTests: @unchecked Sendable {
    private let failSpy = FailSpy()

    @Test
    func failWorks() async throws {
        fail("explain why", failure: failSpy)

        #expect(failSpy.callCount == 1)
        #expect(failSpy.messages.first == "explain why")
    }
}
