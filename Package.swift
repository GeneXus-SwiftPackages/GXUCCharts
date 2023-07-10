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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.0.0-beta.20230710170706"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "1.0.0-beta.20230710170706"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", exact: "1.0.0-beta.20230710170706")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCCharts-1.0.0-beta.20230710170706.xcframework.zip",
			checksum: "f629cb10210357d4a1688f753419bc2e3abda9dda9e1ba99e089cca9126d17ce"
		)
	]
)