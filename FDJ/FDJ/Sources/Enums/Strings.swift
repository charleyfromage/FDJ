enum Strings {
    enum Translations {
        static let unknown = "-"
        
        enum NavigationTitles {
            static let leagues = "Leagues"
            static let teams = "Teams"
            static let team = "Team"
        }

        enum AlertTitle {
            static let error = "Error"
        }
    }
    
    enum API {
        enum Errors {
            static let invalidPath = "Invalid path"
            static let invalidParameters = "Invalid parameters"
        }
        
        enum HTTPRequestHeader {
            enum Keys {
                static let contentType = "Content-Type"
            }
            
            enum Values {
                static let applicationJson = "application/json"
            }
        }
    }
}
