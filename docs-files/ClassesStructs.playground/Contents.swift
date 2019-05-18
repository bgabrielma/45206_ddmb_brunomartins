import Cocoa

/**
 Reference Type
 */
class Carro {
    private var _marca:String = ""
    private var _ano:Int = 0
    
    var marca: String {
        get {
            return self._marca
        }
        set(value) {
            self._marca = value
        }
    }
    
    func go(distance: Double) {
        print("Went \(distance) at a top speed of 'galaooo'")
    }
    
}

class Galao : Carro {
    override init() {
        super.init()
        marca = "EU SOU O GALAO - 2019"
    }
    
    override func go(distance: Double) {
        super.go(distance: distance)
        print("Did \(distance) on a 'o galao' car?" )
    }
}


var galao = Galao()

galao.go(distance: 69)
