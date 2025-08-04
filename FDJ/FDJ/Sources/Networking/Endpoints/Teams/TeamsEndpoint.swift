import Foundation

struct TeamsEndpoint: Endpoint {
    private let leagueId: String

    var path: String {
        API.baseURL + API.Endpoints.teamsEndpoint
    }

    var method: HTTPMethod {
        .GET
    }

    var parameters: [URLQueryItem]? {
        [URLQueryItem(name: API.ParameterKeys.leagueId, value: leagueId)]
    }

    init(leagueId: String) {
        self.leagueId = leagueId
    }
}
