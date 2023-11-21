import Foundation

protocol CardListViewModel: ObservableObject {
    var model: [CardCellView.Model] { get }
}

final class DefaultCardListViewModel: CardListViewModel {
    typealias Model = [CardCellView.Model]
    
    @Published
    private(set) var model: Model = []
}
