import SwiftUI

protocol LeaguesViewState: ObservableObject {
    var viewModel: LeaguesViewModel { get set }
    
    func handle(action: LeaguesViewAction)
}

final class LeaguesViewStateImpl: LeaguesViewState {
    @Published var viewModel: LeaguesViewModel
    
    private var service: GetLeaguesService

    var displayTeams: ((League) -> Void)?
    var displayAlert: ((Error) -> Void)?

    init(viewModel: LeaguesViewModel,
         service: GetLeaguesService,
         displayTeams: ((League) -> Void)?,
         displayAlert: ((Error) -> Void)?) {
        self.viewModel = viewModel
        self.service = service
        self.displayTeams = displayTeams
        self.displayAlert = displayAlert
    }
    
    func handle(action: LeaguesViewAction) {
        switch action {
            case .load:
                Task {
                    await getLeagues()
                }
                
            case .tapOnItem(let league):
                displayTeams?(league)
        }
    }
    
    private func getLeagues() async {
        do {
            let leagues = try await service.getLeagues()
            
            await MainActor.run {
                viewModel.leagues = leagues
            }
        } catch {
            displayAlert?(error)
        }
    }
}
