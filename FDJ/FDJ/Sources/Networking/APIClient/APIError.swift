import Foundation

enum APIError: LocalizedError {
    case invalidPath
    case invalidParameters
    
    var localizedDescription: String {
        return  switch self {
            case .invalidPath: Strings.API.Errors.invalidPath
            case .invalidParameters: Strings.API.Errors.invalidParameters
        }
    }
}
