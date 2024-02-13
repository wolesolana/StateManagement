import Combine

class AppState: ObservableObject {
    @Published var number = 0
    @Published var favoritePrimes: [Int] = []
}
