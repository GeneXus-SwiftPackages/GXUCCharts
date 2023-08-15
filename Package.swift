// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXUCCharts",
	platforms: [.iOS("12.0")],
	products: [
		.library(
			name: "GXUCCharts",
			targets: ["GXUCChartsWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.2.0-rc.1"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "1.2.0-rc.1"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", exact: "1.2.0-rc.1")
	],
	targets: [
		.target(name: "GXUCChartsWrapper",
				dependencies: [
					"GXUCCharts",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS])),
					.product(name: "GXFoundation", package: "GXFoundation", condition: .when(platforms: [.iOS])),
					.product(name: "GXObjectsModel", package: "GXObjectsModel", condition: .when(platforms: [.iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXUCCharts",
			url: "https://pkgs.genexus.dev/iOS/preview/GXUCCharts-1.2.0-rc.1.xcframework.zip",
			checksum: "c21373d0a9c26df3348a8db492807236e5edc23f8c0bc2e8c6bf5a1523671a73"
		)
	]
)