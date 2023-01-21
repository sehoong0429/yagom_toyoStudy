
import Foundation

class CoffeeShop {
    let manager: CafeManager
    
    init(manager: CafeManager) {
        self.manager = manager
    }
    
    func order(_ menu: CoffeeMenu) -> Coffee? {
        return self.manager.brew(menu)
    }
}
