import SwiftUI

struct SingleSheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var title: String
    var mainText: String
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(title)
                    .font(.title2)
                    .bold()
                Text(mainText)
                Spacer()
            }.padding()
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(
                            "Schliessen",
                            systemImage: "xmark.circle"
                        ) {
                            dismiss()
                        }
                    }
                }
        }
    }
}

#Preview {
    SingleSheetView(
        title: "Title_01",
        mainText: "MainText_01"
    )
}
