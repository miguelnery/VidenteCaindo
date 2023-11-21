import SwiftUI

enum CardListViewFactory {
    static func make() -> some View {
        let service = ScryfallServiceFactory.make()
        let viewModel = DefaultCardListViewModel(service: service)
        return CardListView(viewModel: viewModel)
    }
}
