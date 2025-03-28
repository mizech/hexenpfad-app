import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var context
    @Query(sort: \Highlight.title) var highlights: [Highlight]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Der 4,6 Kilometer lange Hexenpfad ist ein perfekter Familien-Wanderweg! Die sagenumwobene Rundtour bietet alles, was auch für Kinder interessant ist: Abenteuerliche Wald-Pfade über Stock und Stein, Kletterfelsen, Höhlen, Ruinen und einen Aussichtsturm.\nAls erstes führt der Weg über eine steile Treppe zum Hexentanzplatz in die Hexenküche hinab. Zum Abschluss neigt sich die Strecke abwärts zum Ausgangspunkt.")
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
                .navigationTitle("Hexenpfad")
                .onAppear() {
                    let seed = Seed(modelContext: context)
                    seed.insertHighlights()
                    print(highlights.count)
                }
        }
    }
}

#Preview {
    ContentView()
}
