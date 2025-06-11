# SwiftAssertions

[![Build](https://github.com/jonreid/SwiftAssertions/actions/workflows/build.yml/badge.svg)](https://github.com/jonreid/SwiftAssertions/actions/workflows/build.yml)

From the author of OCHamcrest and OCMockito, SwiftAssertions is a Swift package containing:

- useful test assertions that go beyond what is built in by reporting detailed failure information.
- tools to create custom assertions that work with either Swift Testing or XCTest.

## Useful test assertions that do more

A good test assertion does more than fail. It reports what was expected, and what the actual value was. This means building in the idea of which value is the expected value.

When built-in assertions fail, we often don't get any information. How did it fail? Why weren't the conditions met? Without this information, we have to spend time debugging our tests. But the test has all the information, and I want to spend less time debugging and more time solving.

You can get detailed test messages from the built-in assertions by adding custom messages. But not many people do this.

The set of assertions in this package is designed to help by:

- explicitly identifying the expected value.
- reporting exactly how it failed.
- working with either Swift Testing or XCTest.

### expectToContain

### expectToEqual

### expectToEventuallyEqual

### expectType

## Tools to create custom assertions

 