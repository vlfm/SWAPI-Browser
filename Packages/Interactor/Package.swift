// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Interactor",
    platforms: [
        .iOS(.v16), .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Interactor",
            targets: ["Interactor"]
        ),
        .library(
            name: "InteractorMock",
            targets: ["InteractorMock"]
        )
    ],
    dependencies: [
        .package(path: "../ApiService"),
        .package(path: "../Domain"),
        .package(path: "../Repository"),
        .package(path: "../TestUtils")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Interactor",
            dependencies: [
                "ApiService",
                "Repository"
            ]
        ),
        .target(
            name: "InteractorMock",
            dependencies: [
                "Interactor",
                "TestUtils"
            ]
        ),
        .testTarget(
            name: "InteractorTests",
            dependencies: [
                "Interactor",
                .product(name: "ApiServiceMock", package: "ApiService"),
                .product(name: "DomainMock", package: "Domain")
            ]
        )
    ]
)
