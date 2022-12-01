import Foundation

class FileService {
    public static func readFile(_ filename: String) -> String? {
        do {
            guard let filepath = Bundle.main.path(forResource: filename, ofType: "txt") else {
                print("Unable to read file \(filename)")
                return nil
            }
            return try String(contentsOfFile: filepath)
        } catch {
            print("Unable to read file \(filename)")
            return nil
        }
    }
}
