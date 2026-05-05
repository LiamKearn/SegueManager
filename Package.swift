// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SegueManager",
    products: [
        .library(
            name: "SegueManager",
            targets: ["SegueManager"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mac-cain13/R.swift.git", from: "7.8.0"),
    ],
    targets: [
        .target(
            name: "SegueManager"),
    ]
)
