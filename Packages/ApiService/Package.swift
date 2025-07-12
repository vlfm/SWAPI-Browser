// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ApiService",
    platforms: [
        .iOS(.v16), .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ApiService",
            targets: ["ApiService"]
        )
        ,
        .library(
            name: "ApiServiceMock",
            targets: ["ApiServiceMock"]
        )
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../HttpClient"),
        .package(path: "../TestUtils")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ApiService",
            dependencies: [
                "Domain",
                "HttpClient"
            ]
        ),
        .target(
            name: "ApiServiceMock",
            dependencies: [
                "ApiService",
                "TestUtils"
            ]
        ),
        .testTarget(
            name: "ApiServiceTests",
            dependencies: [
                "ApiService",
                .product(name: "HttpClientMock", package: "HttpClient")
            ],
            resources: [
                .copy("Json/Film.json"),
                .copy("Json/Films.json"),
                .copy("Json/Person.json"),
                .copy("Json/Planet.json"),
                .copy("Json/Root.json"),
                .copy("Json/Species.json"),
                .copy("Json/Starship.json"),
                .copy("Json/Vehicle.json")
            ]
        )
    ]
)
