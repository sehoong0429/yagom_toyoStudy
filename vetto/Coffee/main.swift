
import Foundation

let vetto: Person = Person(name: "vetto", money: 4900)
let riji: CafeManager = CafeManager(name: "riji", money: 0)
let starbucks: CoffeeShop = CoffeeShop(manager: riji)


func orderCoffee() -> CoffeeMenu? {
    print("1번 누르면 americano, 2번 누르면 latte, 다른 거 누르면 사지 않기")
    guard let input = readLine() else {
        return nil
    }
    switch input {
    case "1":
        return .americano
    case "2":
        return .latte
    default:
        return nil
    }
}

while true {
    guard let coffeeMenu = orderCoffee() else {
        break
    }
    
    vetto.buy(coffeeMenu, at: starbucks)
}
