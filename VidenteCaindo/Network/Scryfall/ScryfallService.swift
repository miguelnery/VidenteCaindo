import BasicNetwork
import Foundation

protocol ScryfallService {
    func fetchSearchCards() async -> Result<[CardPayload], ServiceError>
}

final class DefaultScryfallService<Service: DecoderService> {
    private let service: Service
    
    init(service: Service) {
        self.service = service
    }
}

// MARK: - ScryfallService
extension DefaultScryfallService: ScryfallService {
    func fetchSearchCards() async -> Result<[CardPayload], ServiceError> {
        let result: Result<CardPagePayload, ServiceError> = await service.fetch(from: ScryfallEndpoint.search)
        if case .success(let page) = result {
            return .success(page.data)
        } else { return .failure(.request)}
    }
}
