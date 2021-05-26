// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AllApplesTableViewHandlers",
  platforms: [
    .macOS(.v10_14),
    .iOS(.v12)
  ],
  products: [
    .library(name: "AllApplesTableViewHandlers", targets: ["AllApplesTableViewHandlers"]),
  ],
  dependencies: [
    .package(name: "AllApples", url: "https://github.com/mihaelamj/allapples", .exact("0.9.8")),
    .package(url: "https://github.com/mihaelamj/MMJUtils", .exact("0.2.0"))
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "AllApplesTableViewHandlers",
      dependencies: [
        "AllApples",
      ]),
    .testTarget(
      name: "AllApplesTableViewHandlersTests",
      dependencies: [
        "AllApplesTableViewHandlers",
        "AllApples",
        .product(name: "CollectionUtil", package: "MMJUtils")
      ]),
  ]
)
