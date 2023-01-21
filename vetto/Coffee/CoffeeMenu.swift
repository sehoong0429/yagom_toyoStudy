
import Foundation

enum CoffeeMenu {
    case americano
    case latte
    
    var price: Int {
        switch self {
        case .americano:
            return 5000
        case .latte:
            return 5500
        }
    }
}
