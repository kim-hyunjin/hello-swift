// 프로그래밍에서 모나드가 갖춰야 하는 조건
// 1. 타입을 인자로 받는 타입(특정 타입의 값을 포장) - 제네릭을 통해 구현
// 2. 특정 타입의 값을 포장한 것을 반환하는 함수(메서드)가 존재
// 3. 포장된 값을 변환하여 같은 형태로 포장하는 함수(메서드)가 존재

// 모나드를 이해하는 출발점은 값을 어딘가에 포장하는 개념을 이해햐는 것에서 출발한다.
// 모나드를 사용한 예 중 하나가 바로 옵셔널(값이 있을지 없을지 모르는 상태를 포장)

// 컨텍스트
// 옵셔널은 열거형으로 구현되어 있다.
// 값이 없다면 열거형의 .none으로 있다면 .some(value) case로 값을 지니게 된다.
// 옵셔널의 값을 추출한다는 것은 .some(value) case의 연관값을 꺼내오는 것과 같다.
// 옵셔널은 Wrapped 타입을 인자로 받는 제네릭 타입이다.
func addThree(_ num: Int) -> Int {
    return num + 3
}
print(addThree(2)) // 5
// addThree(Optional(2)) // 오류발생

// 함수객체(Functor)
print(Optional(2).map(addThree) as Any)

var value: Int? = 2
print(value.map{ $0 + 3 })
value = nil
print(value.map{ $0 + 3 })
/*
    함수객체에서 맵 동작 모식도
    map(a->b)-> fa -> fb
    1. 맵이 함수를 인자로 받음
    2. 함수객체에 맵이 전달받은 함수를 적용
    3. 새로운 함수객체 반환

    extension Optional {
        func map<U>(f: (Wrapped) -> U) -> U? {
            switch self {
                case .some(let x): return f(x)
                case .none: return .none
            }
        }
    }
    옵셔널의 map 메서드를 호출하면 옵셔널 스스로 값이 있는지 없는지 switch 구문으로 판단한다.
    값이 있다면 전달받은 함수에 자신의 값을 적용한 결과값을 다시 컨텍스트에 넣어 반환하고,
    그렇지 않다면 함수를 실행하지 않고 빈 컨텍스트를 반환한다.
*/

// 모나드
