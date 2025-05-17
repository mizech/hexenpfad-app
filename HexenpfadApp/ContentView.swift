import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var context
    // Stand: 17.05.2025
    @Query(sort: \Highlight.title) var highlights: [Highlight]
    
    @State var isHelpSheetShown = false
    @State var isInfoSheetShown = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(highlights, id: \.self) { highlight in
                        NavigationLink {
                            HighlightDetailsView(highlight: highlight)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(highlight.title)
                                    .font(.title2)
                                    .bold()
                                Text("Wegpunkt: \(highlight.number)")
                                    .bold()
                                Text(highlight.desc)
                                    .lineLimit(2)
                            }
                        }
                    }
                }.listStyle(.plain)
            }.padding()
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Help", systemImage: "questionmark.circle") {
                            isHelpSheetShown.toggle()
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Info", systemImage: "info.circle") {
                            isInfoSheetShown.toggle()
                        }
                    }
                }
                .navigationTitle("Hexenpfad")
                .onAppear() {
                    if highlights.count == 0 {
                        let seed = Seed(modelContext: context)
                        seed.insertHighlights()
                    }
                    print(highlights.count)
                }
                .sheet(isPresented: $isHelpSheetShown) {
                    SingleSheetView(title: "Verwendung", mainText: "Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi.\nNam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc.")
                }
                .sheet(isPresented: $isInfoSheetShown) {
                    SingleSheetView(title: "Über den Hexenpfad", mainText: "Der 4,6 Kilometer lange Hexenpfad ist ein perfekter Familien-Wanderweg! Die sagenumwobene Rundtour bietet alles, was auch für Kinder interessant ist: Abenteuerliche Wald-Pfade über Stock und Stein, Kletterfelsen, Höhlen, Ruinen und einen Aussichtsturm.\nAls erstes führt der Weg über eine steile Treppe zum Hexentanzplatz in die Hexenküche hinab. Zum Abschluss neigt sich die Strecke abwärts zum Ausgangspunkt.\nInformationstafeln und Installationen bieten Wissenswertes über die Rhöner Kulturlandschaft, ihren Erhalt durch Landschaftspflege und über die Bedeutung der Beweidung für Flora und Fauna.")
                }
        }
    }
}

#Preview {
    ContentView()
}
