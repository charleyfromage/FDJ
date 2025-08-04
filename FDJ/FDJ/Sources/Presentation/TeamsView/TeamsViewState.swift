import SwiftUI

protocol TeamsViewState: ObservableObject {
    var viewModel: TeamsViewModel { get set }
    
    func handle(action: TeamsViewAction)
}

final class TeamsViewStateImpl: TeamsViewState {
    @Published var viewModel: TeamsViewModel
    
    private let league: League
    private var service: GetTeamsService

    var displayTeam: ((Team) -> Void)?
    var displayAlert: ((Error) -> Void)?

    init(for league: League,
         viewModel: TeamsViewModel,
         service: GetTeamsService,
         displayTeam: ((Team) -> Void)?,
         displayAlert: ((Error) -> Void)?) {
        self.league = league
        self.viewModel = viewModel
        self.service = service
        self.displayTeam = displayTeam
        self.displayAlert = displayAlert
    }
    
    func handle(action: TeamsViewAction) {
        switch action {
            case .load:
                Task {
                    await getTeams()
                }
                
            case .tapOnItem(let team):
                displayTeam?(team)
        }
    }
    
    private func getTeams() async {
        do {
            guard let leagueId = league.name
            else {
                return
            }
            
            let teams = try await service.getTeams(for: leagueId)
            
            await MainActor.run {
                viewModel.teams = teams
            }
        } catch {
            displayAlert?(error)
        }
    }
}
