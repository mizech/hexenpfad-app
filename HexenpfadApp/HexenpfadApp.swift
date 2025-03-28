import SwiftData
import SwiftUI

@main
struct HexenpfadApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Highlight.self])
        }
    }
}
