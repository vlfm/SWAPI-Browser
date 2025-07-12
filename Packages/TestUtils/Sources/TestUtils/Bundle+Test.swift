import Foundation

public extension Bundle {
    func data(forResource resource: String, withExtension ext: String) throws -> Data? {
        if let url = self.url(forResource: resource, withExtension: ext) {
            return try Data(contentsOf: url)
        } else {
            return nil
        }
    }

    func jsonData(forResource resource: String) throws -> Data? {
        return try data(forResource: resource, withExtension: "json")
    }
}
