import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(boredapi_backendTests.allTests),
    ]
}
#endif
