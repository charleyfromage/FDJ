protocol TeamsViewModel {
    var teams: [Team] { get set }
    var filteredTeams: [Team] { get }
}

public struct TeamsViewModelImpl: TeamsViewModel {
    public var teams: [Team] = []
    public var filteredTeams: [Team] {
        teams
            .sorted { ($0.name ?? "") > ($1.name ?? "") }   /// Sorting by descending alphabetical order
            .enumerated()
            .filter { $0.0 % 2 == 0 }   /// Retaining only even indexes
            .map { $0.element }
    }
    
    public init() {
        self.teams = []
    }
}
