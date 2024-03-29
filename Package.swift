// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "boredapi-backend",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        // 2
        .package(url: "https://github.com/IBM-Swift/Kitura.git",
                 .upToNextMajor(from: "2.0.0")),
        // 3
        .package(url: "https://github.com/IBM-Swift/HeliumLogger.git",
                 .upToNextMajor(from: "1.0.0")),
        // 4
        .package(url: "https://github.com/IBM-Swift/Kitura-CouchDB.git",
                 .upToNextMajor(from: "3.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "boredapi-backend",
            dependencies: ["Kitura" , "HeliumLogger", "CouchDB"],
            path: "Sources"),
        .testTarget(
            name: "boredapi-backendTests",
            dependencies: ["boredapi-backend"]),
    ]
)
