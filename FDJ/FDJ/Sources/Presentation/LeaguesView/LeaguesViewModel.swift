protocol LeaguesViewModel {
    var searchText: String { get set }
    var leagues: [League] { get set }
    var filteredLeagues: [League] { get }
}

public struct LeaguesViewModelImpl: LeaguesViewModel {
    public var searchText: String = ""
    public var leagues: [League] = []
    public var filteredLeagues: [League] {
        /// We could do some more elaborate matching here but for simplicity let's just retain names containing the search text
        searchText.isEmpty ? [] : leagues.filter { $0.name?.lowercased().contains(searchText.lowercased()) ?? false }
    }
    
    public init() {
        self.searchText = ""
        self.leagues = []
    }
}
