// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "LightURLSessionDataTask",
  platforms: [
    .macOS(.v10_13), .iOS(.v11), .tvOS(.v11),
  ],
  products: [
    .library(
      name: "LightURLSessionDataTask",
      targets: ["LightURLSessionDataTask"]
    ),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "LightURLSessionDataTask",
      dependencies: []
    ),
    .testTarget(
      name: "LightURLSessionDataTaskTests",
      dependencies: ["LightURLSessionDataTask"]
    ),
  ]
)
