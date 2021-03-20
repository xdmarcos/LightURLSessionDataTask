// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "LightURLSessionDataTask",
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
