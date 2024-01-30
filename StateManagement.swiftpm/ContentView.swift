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

private func ordinal(_ n: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .ordinal
    return formatter.string(for: n) ?? ""
}

//BindableObject

import Combine
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
class AppState: ObservableObject {
    @Published var count = 0
}

struct CounterView: View {
    @ObservedObject var state: AppState
    @State var showModal: AppState?
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { self.state.count -= 1 }) {
                    Text("-")
                }
                Text("\(self.state.count)")
                    .foregroundStyle(self.state.count.isPrime ? .green : .red)
                Button(action: { self.state.count += 1 }) {
                    Text("+")
                }
            }
            Button(action: {
                print("\(state.count.isPrime)")
            }) {
                Text("Is this prime?")
            }
            Button(action: {}) {
                Text("What is the \(ordinal(self.state.count)) prime?")
            }
        }
        .font(.title)
        .navigationBarTitle("Counter demo")
    }
}

