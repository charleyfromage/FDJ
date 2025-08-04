protocol GetLeaguesService {
    func getLeagues() async throws -> [League]
}

final class GetLeaguesServiceImpl: GetLeaguesService {
    let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func getLeagues() async throws -> [League] {
        let leagues = try await apiClient.getData(type: Leagues.self, from: LeaguesEndpoint())

        return leagues.list
    }
}
