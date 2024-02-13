import SwiftUI

struct IsPrimeView: View {
    @ObservedObject var state: AppState
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 16) {
            if self.state.number.isPrime {
                Text("\(self.state.number) is prime!!!")
                if self.state.favoritePrimes.contains(self.state.number) {
                    Button(
                        action: { self.state.favoritePrimes.removeAll(
                            where: { $0 == self.state.number })}) {
                                Text("Remove from favorite primes")
                            }
                } else {
                    Button(action: { self.state.favoritePrimes.append(self.state.number) }) {
                        Text("Save to favorite primes")
                    }
                }
            } else {
                Text("\(self.state.number) is not prime :-( ")
            }

            Button("Dismiss") {
                dismiss()
            }
        }        
    }
}
