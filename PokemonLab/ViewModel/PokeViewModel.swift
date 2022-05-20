import Foundation

class PokeViewModel {
    
    var pokemons = [Result]()
    
    var pokemon: PokeDetail? = nil
    
    let URL_API: String = "https://pokeapi.co/api/v2/pokemon?limit=100"
    
    func getDataFromAPI() async {
        // vamos a convertir este string a un url
        // guard es una manera rápida de if
        // guard let url = URL(string: URL_API) else {return}
        do {
            // URLSession.shared.data: sirve para poder realizar peticiones de envio y recibir desde
            // una api siendo estas GET y POST su uso es limitado. En este caso solo es GET
            // URLSession debe ser asincrona
            let (data, _) = try await URLSession.shared.data(from: HelperString.getURLFromString(url: URL_API)!)
            
            if let decoder = try? JSONDecoder().decode(Pokemon.self, from: data) {
                // DispatchQueue.main.async sirve para la espera de datos debido que el internet
                // tiene su propio tiempo para cargar que en el network local, es por eso que algunas
                // veces en las apps podemos que ver que no carga debido a que nuestro internet
                // tiene diferente velocidad
                // como esta data es async si yo hago esto en el primero intento va a esta vacio
                // podeomos crear un Dispatch async para poder ejecutar este forEach
                DispatchQueue.main.async(execute: {
                    decoder.results.forEach { pokemon in
                        // llamado pokemons
                        self.pokemons.append(pokemon)
                    }
                })
            }
        } catch {
            print("error found")
        }
    }
    
    func getPokeDetail(url: String) async {
        do {
            let (data, _) = try await URLSession.shared.data(from: HelperString.getURLFromString(url: url)!)
            
            if let decoder = try? JSONDecoder().decode(PokeDetail.self, from: data) {
                DispatchQueue.main.async(execute: {
                    self.pokemon = decoder
                })
            }
        } catch {
            print("error found")
        }
    }
}
