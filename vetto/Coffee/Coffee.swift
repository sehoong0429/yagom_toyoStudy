
import Foundation

class Coffee {
    let kind: CoffeeMenu
    let amount: Int
    
    init(kind: CoffeeMenu, amount: Int) {
        self.kind = kind
        self.amount = amount
    }
}
