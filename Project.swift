import ProjectDescription

let swiftLintScript = """
if [[ "$(uname -m)" == arm64 ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

if which swiftlint >/dev/null; then
  swiftlint --fix --format
  swiftlint
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
"""

let target = Target.target(
    name: "DishFinder",
    destinations: .iOS,
    product: .app,
    bundleId: "maksim.gurkov.DishFinder",
    deploymentTargets: .iOS("14.0"),
    infoPlist: "DishFinder/Info.plist",
    sources: ["DishFinder/Sources/**"],
    resources: ["DishFinder/Resources/**"],
    scripts: [TargetScript.post(script: swiftLintScript, name: "swiftLintScript")],
    dependencies: [.package(product: "YandexMobileAdsPackage")]
)

let project = Project(
    name: "DishFinder",
    packages: [
        .remote(
            url: "https://github.com/yandexmobile/yandex-ads-sdk-ios.git",
            requirement: .upToNextMajor(from: "7.0.0")
        )
    ],
    settings: Settings.settings(
        base: SettingsDictionary().setProjectVersions(),
        defaultSettings: .recommended
    ),
    targets: [target]
)

extension SettingsDictionary {
    func setProjectVersions() -> SettingsDictionary {
        let currentProjectVersion = "1"
        let markettingVersion = "1.0"
        return appleGenericVersioningSystem().merging([
            "CURRENT_PROJECT_VERSION": SettingValue(stringLiteral: currentProjectVersion),
            "MARKETING_VERSION": SettingValue(stringLiteral: markettingVersion)
        ])
    }
}
