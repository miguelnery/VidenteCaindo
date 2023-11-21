import SwiftUI

struct CardList<ViewModel: CardListViewModel>: View {
    @ObservedObject
    var viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.model, id: \.name) { cellModel in
                CardCellView(model: cellModel)
            }
        }
    }
}
