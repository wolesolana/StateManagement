import SwiftUI

struct CounterView: View {
    @ObservedObject var state: AppState
    @State var isPrimeModalShown: Bool = false
    @State var alertNthPrime: PrimeAlert?
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { self.state.number -= 1 }) {
                    Text("-")
                }
                Text("\(self.state.number)")
                Button(action: { self.state.number += 1 }) {
                    Text("+")
                }
            }
            Button(action: { self.isPrimeModalShown = true}) {
                Text("Is this \(self.state.number) prime?")
            }
            Button(action: {
                let prime = nthPrime(self.state.number)
                self.alertNthPrime = PrimeAlert(prime: prime)
            }) {
                Text("What is the \(ordinal(self.state.number)) prime?")
            }
        }
        .font(.title)
        .navigationBarTitle("Counter demo")
        .sheet(isPresented: self.$isPrimeModalShown,
               onDismiss: { self.isPrimeModalShown = false }) {
            IsPrimeView(state: self.state)
        }
               .alert(item: self.$alertNthPrime) { alert in
                   Alert(
                    title: Text("The \(ordinal(self.state.number)) prime is \(alert.prime)"),
                    dismissButton: .default(Text("Ok"))
                   )
               }
    }

    private func ordinal(_ n: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(for: n) ?? ""
    }
}
