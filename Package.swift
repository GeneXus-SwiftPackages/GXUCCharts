// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXUCCharts",
	platforms: [.iOS("13.0")],
	products: [
		.library(
			name: "GXUCCharts",
			targets: ["GXUCChartsWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.0.0-beta.8")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCCharts-3.0.0-beta.8.xcframework.zip",
			checksum: "5b7b88aa769b0f23ac7426ec65ccbb115b7e5d0ec3af87a3c4463dd4e8cf4155"
		)
	]
)