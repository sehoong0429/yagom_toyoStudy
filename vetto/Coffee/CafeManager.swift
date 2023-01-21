
import Foundation

class CafeManager: Person {
    func brew(_ menu: CoffeeMenu) -> Coffee? {
        self.coffee = Coffee(kind: menu, amount: 500)
        self.money = coffee?.kind.price ?? 0
        return self.coffee
    }
}
