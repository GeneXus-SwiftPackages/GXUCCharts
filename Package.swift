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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.0.0-beta.20230616185027"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "1.0.0-beta.20230616185027"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", exact: "1.0.0-beta.20230616185027")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCCharts-1.0.0-beta.20230616185027.xcframework.zip",
			checksum: "b98885e659ca9ebfa26271a7616f93de08598b130970a68157b732c235ee9db6"
		)
	]
)