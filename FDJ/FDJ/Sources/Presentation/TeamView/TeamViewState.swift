import SwiftUI

protocol TeamViewState: ObservableObject {
    var viewModel: TeamViewModel { get set }
}

final class TeamViewStateImpl: TeamViewState {
    @Published var viewModel: TeamViewModel

    init(viewModel: TeamViewModel) {
        self.viewModel = viewModel
    }
}
