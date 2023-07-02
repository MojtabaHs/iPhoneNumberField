// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iPhoneNumberField",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "iPhoneNumberField",
            targets: ["iPhoneNumberField"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // TODO: - Uncomment path to the main repo and point to a version where this PR (https://github.com/marmelroy/PhoneNumberKit/pull/669) is merged.
//        .package(url: "https://github.com/marmelroy/PhoneNumberKit", .upToNextMajor(from: "3.4.5")),
        .package(url: "https://github.com/MussaCharles/PhoneNumberKit", from: "0.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "iPhoneNumberField",
            dependencies: ["PhoneNumberKit"]),
    ]
)
