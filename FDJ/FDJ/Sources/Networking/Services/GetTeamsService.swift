protocol GetTeamsService {
    func getTeams(for leagueId: String) async throws -> [Team]
}

final class GetTeamsServiceImpl: GetTeamsService {
    let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func getTeams(for leagueId: String) async throws -> [Team] {
        let teams = try await apiClient.getData(type: Teams.self, from: TeamsEndpoint(leagueId: leagueId))

        return teams.list
    }
}
