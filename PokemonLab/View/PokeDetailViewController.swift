import UIKit

class PokeDetailViewController: UIViewController {
    //url no acepta nil, por lo tanto se pasa a string vacio
    var url: String = ""
    var pokemon: PokeDetail? = nil
    let pokeViewModel: PokeViewModel = PokeViewModel() //importar viewmodel

    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var lblNamePokemon: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await setUpView()
        }
    }
        
    func setUpView() async {
        await pokeViewModel.getPokeDetail(url: url)
        pokemon = pokeViewModel.pokemon
        setUpPokeData()
    }
    
    func setUpPokeData() {
        //cambiar fondo de pantalla según la clase del pokemon
        view.backgroundColor = PokeTypes.types[(pokemon?.types[0].type.name)!]
        
        
        lblNamePokemon.text = pokemon?.name.capitalized
        lblType.text = pokemon?.types[0].type.name.capitalized ?? ""
        imagePokemon.image = HelperImage.setImageFromUrl(url: (pokemon?.sprites.other.officialArtwork.front_default)!)
    }
}
