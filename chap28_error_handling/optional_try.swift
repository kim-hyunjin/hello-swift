/*
    try?를 사용해 옵셔널 값으로 변환하여 오류를 처리할 수도 있다.
    오류를 던지면 반환 값은 nil이 된다.
*/

func someThrowingFunction(shouldThrowError: Bool) throws -> Int {
    if shouldThrowError {
        enum SomeError: Error {
            case juseSomeError
        }
        
        throw SomeError.juseSomeError
    }
    return 100
}

let x: Optional = try? someThrowingFunction(shouldThrowError: true)
print(x as Any) // nil
let y: Optional = try? someThrowingFunction(shouldThrowError: false)
print(y as Any) // Optional(100)
// someThrowingFunction(shouldThrowError:)의 반환타입이 Int라도 try? 표현을 사용하면 옵셔널이 된다.