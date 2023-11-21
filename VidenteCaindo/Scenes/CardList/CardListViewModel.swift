import Foundation

protocol CardListViewModel: ObservableObject {
    var model: [CardCellView.Model] { get }
}

final class DefaultCardListViewModel<Service: ScryfallService> : CardListViewModel {
    typealias Model = [CardCellView.Model]
    private let service: Service
    
    @Published
    private(set) var model: Model = []
    
    init(service: Service) {
        self.service = service
        Task { await fetchModel() }
    }
    
    @MainActor
    private func fetchModel() async {
        let fetchResult = await service.fetchSearchCards()
        if case .success(let model) = fetchResult {
            self.model = model.map { CardCellView.Model(name: $0.name) }
        }
        // error handling
    }
}
