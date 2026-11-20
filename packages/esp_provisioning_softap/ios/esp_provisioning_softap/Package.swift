// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "esp_provisioning_softap",
  platforms: [
    .iOS("13.0")
  ],
  products: [
    .library(name: "esp-provisioning-softap", targets: ["esp_provisioning_softap"])
  ],
  dependencies: [
    .package(name: "FlutterFramework", path: "../FlutterFramework")
  ],
  targets: [
    .target(
      name: "esp_provisioning_softap",
      dependencies: [
        .product(name: "FlutterFramework", package: "FlutterFramework")
      ]
    )
  ]
)
