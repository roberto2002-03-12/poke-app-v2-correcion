import Foundation
import UIKit

class HelperImage {
    
    static func setImage(id: String) -> UIImage? {
        /*
        let url = URL(string: getUrlImage(id: id)) //obtener url y id de setUrl
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            let image = UIImage(data: imageData)
            return image
        }
        
        return nil
         */
        return convertImageFromURL(url: getUrlImage(id: id))
    }
    
    static func setImageFromUrl(url: String) -> UIImage? {
        return convertImageFromURL(url: url)
    }
    
    static func convertImageFromURL(url: String) -> UIImage? {
        let data = try? Data(contentsOf: HelperString.getURLFromString(url: url)!)
        
        if let imageData = data {
            return UIImage(data: imageData)
        }
        
        return nil
    }
    
    static func getUrlImage(id: String) -> String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
    }
}
