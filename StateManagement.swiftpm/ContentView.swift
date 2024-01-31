import SwiftUI

struct ContentView: View {
    @ObservedObject var state: AppState
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CounterView(state: self.state)) {
                    Text("Counter demo")
                }
                NavigationLink(destination: EmptyView()) {
                    Text("Favorite primes")
                }
            }
            .navigationBarTitle("State management")
        }
    }
}

extension Int {
    var isPrime: Bool {
        if(self < 2) {
            return false
        }            
        for i in 2..<self {
            if (self % i == 0) {
                return false
            }
        }
        return true
    }
}
