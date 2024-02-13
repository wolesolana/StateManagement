import SwiftUI

struct FavoritePrimesView: View {
    @ObservedObject var state: AppState

    var body: some View {
        List {
            ForEach(self.state.favoritePrimes, id: \.self) { prime in
                Text("\(prime)")

            }
            .onDelete(perform: { indexSet in
                for index in indexSet {
                    self.state.favoritePrimes.remove(at: index)
                }
            })
        }
        .navigationBarTitle(Text("Favorite Primes"))
    }
}
