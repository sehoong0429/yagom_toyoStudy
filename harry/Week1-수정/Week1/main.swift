//
//  main.swift
//  Week1
//
//  Created by Harry on 2022/12/24.

enum PurchaseError: Error {
    case outOfProductNumber(from: Int)
    case lackOfMoney(remain: Int)
    case invalidNumber
    case outOfStock
}

var budget: Int = 2000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업", nil]

//for index in productsList.indices {
//    if let product = productsList[index] {
//        print("\(index)번 상품은 \(product)입니다.")
//    }
//}

//print("------------------------------")
//
//func buy(productNumber: Int) throws {
//    if budget < 1000 {
//        throw PurchaseError.lackOfMoney(remain: budget)
//    }
//    guard productNumber >= 0, productNumber <= 5 else {
//        throw PurchaseError.outOfProductNumber(from: productNumber)
//    }
//
//    if let product = productsList[productNumber] {
//        budget -= 1000
//        print("\(product)(을/를) 구매하였습니다. 남은금액 : \(budget)원")
//    }
//}
//
//func readProductNumber() throws -> Int? {
//    print("구매할 상품 번호를 입력 : ", terminator: "")
//    guard let productNumber = readLine() else {
//        throw PurchaseError.invalidNumber
//    }
//    if productNumber == "" {
//        throw PurchaseError.invalidNumber
//    }
//    if productNumber == "x"{
//        throw PurchaseError.invalidNumber
//    }
//
//    return Int(productNumber)
//}
//
//var flag: Bool = true
//
//while flag {
//    do {
//        guard let productNumber = try? readProductNumber() else {
//            throw PurchaseError.invalidNumber
//        }
//        try buy(productNumber: productNumber)
//    } catch PurchaseError.invalidNumber {
//        print("잘못된 입력입니다. 다시 입력해주세요!")
//    } catch PurchaseError.lackOfMoney(remain: let money){
//        print("금액이 부족합니다! 남은잔액 : \(money)")
//        flag = false
//    } catch PurchaseError.outOfProductNumber(from: let number) {
//        print("\(number)번(은/는) 상품 목록에 없습니다!")
//    }
//}



// MARK: - ////////////////////////////////////////////////////////

//@frozen enum Result<Success, Failure> where Failure : Error

func buy(productNumber: Result<Int, PurchaseError>) throws -> Result<(Int, String), PurchaseError> {
    if budget < 1000 {
        return .failure(.lackOfMoney(remain: budget))
    }
    let number = try productNumber.get()

    if number <= 0 && number >= 5 {
        return .failure(.outOfProductNumber(from: number))
    }
    guard let product = productsList[number] else {
        return .failure(.outOfStock)
    }

    budget -= 1000

    guard let index = productsList.firstIndex(of: product) else {
        return .failure(.outOfStock)
    }
    productsList.remove(at: index)

    return .success((index, product))
}

func readProductNumber() -> Result<Int, PurchaseError>{
    print("구매할 상품 번호를 입력 : ", terminator: "")
    guard let productNumber = readLine() else {
        return .failure(.invalidNumber)
    }
    guard let number = Int(productNumber), productNumber != "", productNumber != "x" else {
        return .failure(.invalidNumber)
    }
    return .success(number)
}



var flag: Bool = true

while flag {
    let number = readProductNumber()

    let product = try! buy(productNumber: number)

    switch product {
    case .success((let index, let name)):
        print("\(index)번 \(name)(을/를) 구매했습니다.\n 남은금액 : \(budget)원")
    case .failure(.lackOfMoney(remain: let money)):
        print("금액이 부족합니다! 남은잔액 : \(money)")
        flag = false
    case .failure(.outOfProductNumber(from: let number)):
        print("\(number)번(은/는) 상품 목록에 없습니다!")
    case .failure(.outOfStock):
        print("선택하신 물품은 재고가 없습니다 !")
    case .failure(.invalidNumber):
        print("잘못된 숫자입니다.")
    }
}
