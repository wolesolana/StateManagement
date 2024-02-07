import SwiftUI

struct isPrimeView: View {
    @ObservedObject var state: AppState
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            if self.state.count.isPrime {
                Text("\(self.state.count) is prime!!!")
                Button(action: {}) {
                    Text("Save/remove to/from favorite primes")
                }
            } else {
                Text("\(self.state.count) is not prime :-( ")
            }

            Button("Dismiss") {
                dismiss()
            }
        }        
    }
}
