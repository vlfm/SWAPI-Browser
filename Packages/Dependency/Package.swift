// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dependency",
    platforms: [
        .iOS(.v16), .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Dependency",
            targets: ["Dependency"]
        )
    ],
    dependencies: [
        .package(path: "../Interactor")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Dependency",
            dependencies: [
                "Interactor"
            ]
        ),
        .testTarget(
            name: "DependencyTests",
            dependencies: ["Dependency"]
        )
    ]
)
