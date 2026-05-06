// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXUCCharts",
	platforms: [.iOS("15.0")],
	products: [
		.library(
			name: "GXUCCharts",
			targets: ["GXUCChartsWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "4.2.0-beta.12")
	],
	targets: [
		.target(name: "GXUCChartsWrapper",
				dependencies: [
					"GXUCCharts",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXUCCharts",
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCCharts-4.2.0-beta.12.xcframework.zip",
			checksum: "ae13b20cc4f93e5413d451cbc00e79fd70d42df4cbf6bb3fcf4feb1803c864c1"
		)
	]
)