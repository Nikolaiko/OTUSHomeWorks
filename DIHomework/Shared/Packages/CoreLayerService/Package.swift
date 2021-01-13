// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreLayerService",
    platforms: [.iOS(.v13), .macOS(.v11), .tvOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CoreLayerService",
            targets: ["CoreLayerService"]),
    ],
    dependencies: [
        .package(name: "Realm", url: "https://github.com/realm/realm-cocoa.git", from: "10.5.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CoreLayerService",
            dependencies: [.product(name: "RealmSwift", package: "Realm")]),            
        .testTarget(
            name: "CoreLayerServiceTests",
            dependencies: ["CoreLayerService"]),
    ]
)
