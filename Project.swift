import ProjectDescription

let project = Project(
    name: "Promptum",
    targets: [
        .target(
            name: "Promptum",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Promptum",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["Promptum/Sources/**"],
            resources: ["Promptum/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "PromptumTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.PromptumTests",
            infoPlist: .default,
            sources: ["Promptum/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Promptum")]
        ),
    ]
)
