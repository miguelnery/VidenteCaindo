import BasicNetwork
import Foundation

enum ScryfallEndpoint {
    case search
}

extension ScryfallEndpoint: Endpoint {
    var urlRequest: URLRequest? {
        guard let url = url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method
        return request
    }
    
    private var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.scryfall.com"
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
    
    private var path: String {
        switch self {
        case .search: return "/cards/search"
        }
    }
    
    private var queryItems: [URLQueryItem] {
        [
            URLQueryItem(name: "order", value: "cmc"),
            URLQueryItem(name: "q", value: "c:r+pow=3"),
        ]
    }
    
    private var method: String {
        "GET"
    }
}
