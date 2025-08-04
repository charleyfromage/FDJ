enum API {
    static let baseURL = "https://www.thesportsdb.com/api/v1/json/\(API.Keys.default)/"

    enum Endpoints {
        static let leaguesEndpoint = "all_leagues.php"
        static let teamsEndpoint = "search_all_teams.php"
    }
    
    enum ParameterKeys {
        static let leagueId = "l"
    }
}
