import SwiftUI

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

private func ordinal(_ n: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .ordinal
    return formatter.string(for: n) ?? ""
}
