extension String {
    // Handle values like "length": "36.8 " (from https://swapi.info/api/vehicles/4)
    var trimmed: String {
        trimmingCharacters(in: .whitespaces)
    }

    func parseDouble(message: @autoclosure () -> String) throws -> Double {
        if let value = Double(trimmed) {
            return value
        } else {
            throw ApiServiceError.mappingError(message())
        }
    }

    func parseInt(message: @autoclosure () -> String) throws -> Int {
        // Handle values like "crew": "342,953"
        if let value = Int(trimmed.replacing(",", with: "")) {
            return value
        } else {
            throw ApiServiceError.mappingError(message())
        }
    }

    func parseInt64(message: @autoclosure () -> String) throws -> Int64 {
        if let value = Int64(trimmed) {
            return value
        } else {
            throw ApiServiceError.mappingError(message())
        }
    }

    func splitByCommas() -> [String] {
        return trimmed.split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespaces) }
    }
}
