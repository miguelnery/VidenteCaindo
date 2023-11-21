import BasicNetwork
import Foundation

enum ScryfallServiceFactory {
    static func make() -> some ScryfallService {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return DefaultScryfallService(service: DefaultDecoderService(fetcher: URLSessionService(),
                                                                     jsonDecoder: jsonDecoder))
    }
}
