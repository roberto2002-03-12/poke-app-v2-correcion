import Foundation

class HelperString {
    
    static func getIdFromUrl(url: String) -> String {
        return url.components(separatedBy: "/").filter({ $0 != ""}).last!
    }
    
    //funcion para obtener url de un string
    static func getURLFromString(url: String) -> URL? {
        guard let url = URL(string: url) else { return nil }
        
        return url
    }
}

