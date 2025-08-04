import Foundation

public struct Team: Hashable, Equatable {
    public var id: String
    public var name: String?
    public var country: String?
    public var league: String?
    public var badgeImageURL: URL?
    public var bannerImageURL: URL?
    public var description: String?
    
    public init(id: String,
                name: String? = nil,
                country: String? = nil,
                league: String? = nil,
                badgeImageURL: URL? = nil,
                bannerImageURL: URL? = nil,
                description: String? = nil) {
        self.id = id
        self.name = name
        self.country = country
        self.league = league
        self.badgeImageURL = badgeImageURL
        self.bannerImageURL = bannerImageURL
        self.description = description
    }
}

extension Team: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "idTeam"
        case name = "strTeam"
        case badgeImageURL = "strTeamBadge"
        case bannerImageURL = "strTeamBanner"
        case description = "strDescriptionEN"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        if let urlString = try container.decodeIfPresent(String.self, forKey: .badgeImageURL) {
            self.badgeImageURL = URL(string: urlString)
        }
        
        if let urlString = try container.decodeIfPresent(String.self, forKey: .bannerImageURL) {
            self.bannerImageURL = URL(string: urlString)
        }
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
    }
}
