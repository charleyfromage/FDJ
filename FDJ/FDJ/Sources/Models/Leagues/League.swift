public struct League: Hashable, Equatable {
    public var id: String
    public var name: String?
    
    public init(id: String, name: String? = nil) {
        self.id = id
        self.name = name
    }
}

extension League: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "idLeague"
        case name = "strLeague"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}
