import SwiftUI

struct ErrorView: View {
    let errorState: ErrorState
    let retryAction: () -> Void

    var body: some View {
        VStack {
            Text(errorState.message)
            Button(action: retryAction) {
                Text(errorState.retryActionTitle)
            }
        }
    }
}
