import SwiftUI

extension FDJApp {  /// Since we don't have too many factories here, I kept things simple. In a larger project ideally we'd create dedicated factory objects for each view.
    @ViewBuilder func view(for navigationStep: NavigationStep) -> some View {
        switch navigationStep {
            case .leagues:
                leaguesView()
                    .navigationTitle(Strings.Translations.NavigationTitles.leagues)
            case .teams(let league):
                teamsView(for: league)
                    .navigationTitle(league.name ?? Strings.Translations.NavigationTitles.teams)
            case .team(let team):
                teamView(for: team)
                    .navigationTitle(team.name ?? Strings.Translations.NavigationTitles.team)
        }
    }

    @ViewBuilder func leaguesView() -> some View {
        let leaguesViewModel = LeaguesViewModelImpl()
        let getLeaguesService = GetLeaguesServiceImpl(apiClient: APIClientImpl())

        let leaguesViewState = LeaguesViewStateImpl(viewModel: leaguesViewModel,
                                                    service: getLeaguesService,
                                                    displayTeams: { league in
            navigationPath.append(NavigationStep.teams(league))
        }, displayAlert: { error in
            errorMessage = ErrorMessage(text: error.localizedDescription)
        })

        LeaguesView(state: leaguesViewState)
    }

    @ViewBuilder func teamsView(for league: League) -> some View {
        let teamsViewModel = TeamsViewModelImpl()
        let getTeamsService = GetTeamsServiceImpl(apiClient: APIClientImpl())

        let teamsViewState = TeamsViewStateImpl(for: league, viewModel: teamsViewModel,
                                                service: getTeamsService,
                                                displayTeam: { team in
            navigationPath.append(NavigationStep.team(team))
        }, displayAlert: { error in
            errorMessage = ErrorMessage(text: error.localizedDescription)
        })

        TeamsView(state: teamsViewState)
    }

    @ViewBuilder func teamView(for team: Team) -> some View {
        let teamViewModel = TeamViewModelImpl(team: team)
        let teamViewState = TeamViewStateImpl(viewModel: teamViewModel)

        TeamView(state: teamViewState)
    }
}
