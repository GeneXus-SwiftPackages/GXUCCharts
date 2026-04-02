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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "4.2.0-beta.3")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCCharts-4.2.0-beta.3.xcframework.zip",
			checksum: "bb5eaf8e70c36df643a076b6318853afa4241d054add655294da74a1ab1e0ffb"
		)
	]
)