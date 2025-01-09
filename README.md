# Unhandled Exceptions in Dart's `http` Package

This example demonstrates a common issue in Dart applications that use the `http` package for network requests: unhandled exceptions.  The `bug.dart` file shows a basic implementation with a `try-catch` block, but more robust error handling is often needed for production-ready applications.  The `bugSolution.dart` file provides improved error handling techniques.

## How to Reproduce the Bug

1.  Ensure you have the `http` package installed (`pub add http`).
2.  Run `bug.dart`.  If the API is unreachable, or returns a non-200 status code, the exception won't be handled effectively.

## Solution

The `bugSolution.dart` file shows a more sophisticated approach to handling exceptions, including:
*   Specific exception handling for different error scenarios.
*   Retry mechanisms for transient network issues.
*   User-friendly error messages.
*   Logging of errors for debugging purposes.
