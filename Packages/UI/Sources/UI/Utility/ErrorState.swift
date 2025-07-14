import Foundation

struct ErrorState: Equatable {
    let message: String
    let retryActionTitle: String
}

extension ErrorState {
    init(error: Error) {
        self.init(
            message: error.localizedDescription,
            retryActionTitle: "Try again"
        )
    }
}
