// swift-tools-version: 5.9
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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.0.0-beta.26")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCCharts-2.0.0-beta.26.xcframework.zip",
			checksum: "a7e570e8e9b8044d7d92ddd4566f87048df646915bb3a3c41765cdbeee58e0b1"
		)
	]
)