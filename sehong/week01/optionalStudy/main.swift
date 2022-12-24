//
//  main.swift
//  optionalStudy
//
//  Created by Seoyeon Hong on 2022/12/24.
//
///1. 함수의 생성과 호출
///2. 전달인자레이블 사용
func sayHi(from myName:String, to myFriend: String) -> String {
    return "안녕 \(myFriend)! 내 이름은 \(myName)이야"
}

print(sayHi(from: "sehong", to: "yagom"))

func sayHi(_ myFriend: String, _ myName:String = "sehong") -> String {
    return "안녕 \(myFriend)! 내 이름은 \(myName)이야"
}

print(sayHi("yagomAcademy"))

///옵셔널타입의 배열을 이용해 예외사항을 처리해보기
var number : Int = 7
print(type(of: number))

var budget: Int = 2000
var climbingProductList: [String?] = ["암벽화", "초크", "초크백", "자일", "하네스"]
var existList = [String]()

enum buyError: Error {
    case noBudget
    case noProduct
}

func buyProduct(number: Int) {
    do{
        try buy(productNumber: number)
    } catch buyError.noBudget {
        print("잔액이 부족합니다. 남은 잔액: \(budget)")
    } catch buyError.noProduct {
        print("원하는 상품의 재고가 부족합니다. 남은 상품: \(existList)")
    } catch {
        print("해결할 수 없는 에러 발생")
    }
}

func buy(productNumber: Int) throws {
    guard let product = climbingProductList[productNumber] else { throw buyError.noProduct }
    if budget == 0 {
        throw buyError.noBudget
    }
    
    budget -= 1000
    
    print("\(product)(가)이 구매되었습니다.")
    climbingProductList[productNumber] = nil
    existList = climbingProductList.filter { $0 != nil }.map { $0! }
    print("남은 잔액: \(budget)")
    print("남은 상품: \(existList)")
}

buyProduct(number: 2)
buyProduct(number: 2)
buyProduct(number: 1)
buyProduct(number: 1)
buyProduct(number: 3)
