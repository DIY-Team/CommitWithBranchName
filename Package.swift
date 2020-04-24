// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommitWithBranchName",
    dependencies: [
        .package(url: "https://github.com/DIY-Team/install-swift-script.git", from: "0.0.1"),
        .package(url: "https://github.com/DIY-Team/RunsShellCommand", from: "0.0.1")
    ],
    targets: [
        .target(
            name: "CommitWithBranchName",
            dependencies: ["CommitWithBranchNameCore"]),
        .target(name: "CommitWithBranchNameCore",
                dependencies: ["RunsShellCommand"]),
        .target(
            name: "Install",
            dependencies: ["InstallSwiftScriptCore"])
    ]
)
