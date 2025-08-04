import SwiftUI

@main
struct FDJApp: App {
    @State var navigationPath = NavigationPath()
    @State private var shouldDisplayAlert: Bool = false
    @State var errorMessage: ErrorMessage? {
        didSet {
            if let text = errorMessage?.text,
               !text.isEmpty {
                shouldDisplayAlert = true
            } else {
                shouldDisplayAlert = false
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationPath) {
                leaguesView()
                    .navigationDestination(for: NavigationStep.self) { step in
                        view(for: step)
                    }
            }
            .alert(item: $errorMessage) { errorMessage in
                Alert(title: Text(Strings.Translations.AlertTitle.error),
                      message: Text(errorMessage.text ?? Strings.Translations.unknown),
                      dismissButton: .cancel())
            }
        }
    }
}
