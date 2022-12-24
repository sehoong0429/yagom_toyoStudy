//
//  main.swift
//  2022.12.24
//
//  Created by jiye Yi on 2022/12/24.
//

import Foundation

var budget: Int = 2000
var productList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
var leftProductList: [String] = []
var isOutOfBudget: Bool = false
for index in 0..<productList.count {
    if let product = productList[index] {
        print("\(index)번 상품은 \(product)입니다.")
    }
}

enum PurchasementError: Error {
    case invalidProductIndexError
    case outOfStockError
    case outOfBudgetError
}

func buy(productNumber: Int) -> Result<[String]?, PurchasementError> {
    
    if budget < 1000 {
        return .failure(PurchasementError.outOfBudgetError)
    }
    if productList[productNumber] == nil {
        return .failure(PurchasementError.outOfStockError)
    }
    if productNumber > productList.count {
        return .failure(PurchasementError.invalidProductIndexError)
    }
    budget -= 1000
    productList[productNumber] = nil
    leftProductList = productList.compactMap{ $0 }
    return .success(leftProductList)
}

func buyProduct() {
    print("원하는 상품을 입력해주세요.")
    let input : String? = readLine()
    guard let inputValue = input, let inputProductNumber = Int(inputValue) else {
        return
    }
    let checkCondition = buy(productNumber: inputProductNumber)
    switch checkCondition {
    case .success(_):
    print("\(inputProductNumber)번 상품을 구입하였습니다!")
    case .failure(let error):
        switch error {
        case .invalidProductIndexError:
            print("상품 번호가 잘못되었습니다.")
        case .outOfStockError:
            print("상품의 재고가 없습니다.")
        case .outOfBudgetError:
            print("잔액이 부족합니다.")
            return isOutOfBudget = true
        }
    }
}

while !isOutOfBudget {
    buyProduct()
}

