
import Foundation

class Person {
    var name: String
    var money: Int
    var coffee: Coffee?
    
    init(name: String, money: Int, coffee: Coffee? = nil) {
        self.name = name
        self.money = money
        self.coffee = coffee
    }
    
    func buy(_ menu: CoffeeMenu, at shop: CoffeeShop) {
        if menu.price <= self.money {
            self.money -= menu.price
            self.coffee = shop.order(menu)
            print("\(coffee!.kind) 냠냠")
        } else {
            print("잔액이 부족합니다.")
        }
    }
}
