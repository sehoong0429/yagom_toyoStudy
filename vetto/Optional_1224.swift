//  Created by vetto on 2022/12/24.

import Foundation

//  if let
for index in 0..<productsList.count {
    if let product = productsList[index] {
        print("\(index)번 상품은 \(product)입니다.")
    }
}

// guard let
for index in 0..<productsList.count {
    guard let product = productsList[index] else {
        continue
    }
    print("\(index)번 상품은 \(product)입니다.")
}

// 강제 추출
for index in 0..<productsList.count {
    let product = productsList[index]!
    print("\(index)번 상품은 \(product)입니다.")
}

// nil coalescing
for index in 0..<productsList.count {
    let product = productsList[index] ?? ""
    print("\(index)번 상품은 \(product)입니다.")
}

// if let
func buy(productNumber: Int) {
    if productNumber > productsList.count || productNumber < 0 {
        print("존재하지 않는 번호입니다.")
        return
    }
    
    if let product = productsList[productNumber] {
        if budget < 1000 {
            print("예산 초과")
            return
        }
        budget -= 1000
        productsList[productNumber] = nil
        print("\(productNumber)번 상품 \(product) 구매 완료")
    } else {
        print("품절입니다.")
    }
}

// guard let
func buy(productNumber: Int) {
    guard 0 < productNumber && productNumber < productsList.count else {
        print("존재하지 않는 번호입니다.")
        return
    }
    
    guard let product = productsList[productNumber] else {
        print("품절입니다.")
        return
    }
    
    guard budget >= 1000 else {
        print("예산 초과")
        return
    }
    
    budget -= 1000
    productsList[productNumber] = nil
    print("\(productNumber)번 상품 \(product) 구매 완료")
}

// nil coalescing
func buy(productNumber: Int) {
    if productNumber > productsList.count || productNumber < 0 {
        print("존재하지 않는 번호입니다.")
        return
    }
    
    let product: String = productsList[productNumber] ?? ""
    
    guard product != "" else {
        print("품절입니다.")
        return
    }
    
    if budget < 1000 {
        print("예산 초과")
        return
    }
    
    budget -= 1000
    productsList[productNumber] = nil
    print("\(productNumber)번 상품 \(product) 구매 완료")
}

