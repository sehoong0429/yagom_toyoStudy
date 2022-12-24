//
//  main.swift
//  Week1
//
//  Created by Harry on 2022/12/24.
//

import Foundation

enum PurchaseError: Error {
    case invalidInput
    case lackOufMoney(remain: Int)
    case outOfProductNumber
    case outOfStock
}

var budget: Int = 2000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

//func readProductNumber() throws -> Int {
//    print("구매 할 상품번호 입력: ", terminator: "")
//    guard let input = readLine() else {
//        throw PurchaseError.invalidInput
//    }
//    guard let productNumber = Int(input) else {
//        throw PurchaseError.invalidInput
//    }
//
//    return productNumber
//}
//
//func buy(productNumber: Int) throws {
//    guard productNumber >= 0, productNumber <= 5 else {
//        throw PurchaseError.invalidInput
//    }
//    // 위에서 0~5 사이 숫자만 받기때문에 밑의 에러처리는 재고 없음 이다.
//    guard let productName = productsList[productNumber] else {
//        throw PurchaseError.outOfStock
//    }
//    guard budget >= 1000 else {
//        throw PurchaseError.lackOufMoney(remain: budget)
//    }
//    budget -= 1000
//    print("\(productNumber)번 \(productName)(을/를) 구매했습니다.")
//    productsList[productNumber] = nil
//}
//
//var flag: Bool = true
//
//// 잔액이 부족할때 중단됨
//while flag {
//    do {
//        let productNumber = try readProductNumber()
//        try buy(productNumber: productNumber)
//    } catch PurchaseError.invalidInput {
//        print("PurchaseError.invalidInput: 잘못된 입력입니다.\n")
//    } catch PurchaseError.outOfStock {
//        print("PurchaseError.outOfStock: 재고가 없습니다\n")
//    } catch PurchaseError.lackOufMoney(remain: let money) {
//        print("PurchaseError.lackOufMoney 잔액부족(잔액: \(money)원)\n")
//        flag = false
//    }
//}

func readProductNumber() -> Result<Int, PurchaseError> {
    print("구매 할 상품번호 입력: ", terminator: "")
    guard let input = readLine() else {
        return .failure(.invalidInput)
    }
    guard let productNumber = Int(input) else {
        return .failure(.invalidInput)
    }
    
    return .success(productNumber)
}

func buy(productNumber: Int) -> Result<(Int, String), PurchaseError> {
    guard productNumber >= 0, productNumber <= 5 else {
        return .failure(.invalidInput)
    }
    // 위에서 0~5 사이 숫자만 받기때문에 밑의 에러처리는 재고 없음 이다.
    guard let productName = productsList[productNumber] else {
        return .failure(.outOfStock)
    }
    guard budget >= 1000 else {
        flag = false
        return .failure(.lackOufMoney(remain: budget))
    }
    
    return .success((productNumber, productName))
}

var flag: Bool = true

while flag {
    let productNumber = try readProductNumber().get()
    let result = buy(productNumber: productNumber)
    
    switch result {
    case .success((let productNumber, let productName)):
        budget -= 1000
        print("\(productNumber)번 \(productName)(을/를) 구매했습니다.")
        productsList[productNumber] = nil
    case .failure(.lackOufMoney(remain: let money)):
        print("PurchaseError.lackOufMoney 잔액부족(잔액: \(money)원)\n")
    case .failure(.invalidInput):
        print("PurchaseError.invalidInput: 잘못된 입력입니다.\n")
    case .failure(.outOfStock):
        print("PurchaseError.outOfStock: 재고가 없습니다\n")
    case .failure(.outOfProductNumber):
        print("PurchaseError.outofProductNumber: 상품 목록 번호의 범위가 아닙니다.")
    }
}
