import SwiftUI

struct CardCellView: View {
    let model: Model
    
    var body: some View {
        Text(model.name)
    }
}

extension CardCellView {
    struct Model {
        let name: String
    }
}
