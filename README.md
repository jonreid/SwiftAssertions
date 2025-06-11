# SwiftAssertions

[![Build](https://github.com/jonreid/SwiftAssertions/actions/workflows/build.yml/badge.svg)](https://github.com/jonreid/SwiftAssertions/actions/workflows/build.yml)

From the author of [OCHamcrest](https://github.com/hamcrest/OCHamcrest) and [OCMockito](https://github.com/jonreid/OCMockito), SwiftAssertions is a Swift package containing:

- useful test assertions that go beyond what is built in by reporting detailed failure information.
- tools to create custom assertions that work with either Swift Testing or XCTest.

## Why not just use built-in assertions?

Consider a failing test using XCTest's `XCTAssertEqual`:

```swift
XCTAssertEqual(result, 42)
```

If this fails, you might see a message like:

```
XCTAssertEqual failed: ("41") is not equal to ("42")
```

But which value is the expected one, and which is the actual? The message doesn't say. You have to look back at the test code and remember the argument order. And why do they look like quoted strings?

Swift Testing's `#expect` is similar:

```swift
#expect(result == 42)
```

A failure might look like:

```
Expectation failed: (result → 41) == 42
```

That's a bit better because you can see the code that was evaluated, `result`. But it's still hard to read.

By contrast, here's one of the assertions from this package:

```swift
expectToEqual(result, expected: 42)
```

A failure might say:

```
Expected 42, but was 41
```

Simple. Unambiguous.

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

 