import Dependency
import SwiftUI
import UI

@main
struct SWAPIBrowserApp: App {
    let container = makeDependencyContainer()

    var body: some Scene {
        WindowGroup {
            MainView(container: container)
        }
    }
}
