// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "LightURLSessionTask",
  products: [
    .library(
      name: "LightURLSessionTask",
      targets: ["LightURLSessionTask"]
    ),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "LightURLSessionTask",
      dependencies: []
    ),
    .testTarget(
      name: "LightURLSessionTaskTests",
      dependencies: ["LightURLSessionTask"]
    ),
  ]
)
