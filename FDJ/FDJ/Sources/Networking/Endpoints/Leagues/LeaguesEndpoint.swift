import Foundation

struct LeaguesEndpoint: Endpoint {
    var path: String {
        API.baseURL + API.Endpoints.leaguesEndpoint
    }

    var method: HTTPMethod {
        .GET
    }

    var parameters: [URLQueryItem]?
}
