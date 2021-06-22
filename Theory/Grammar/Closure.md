## 클로져

- 클로저 표현식은 독립적인 코드 블록

```swift
func add(x:Int , y:Int) -> Int {
	return (x+y)
}

let add1 = { (x:Int, y:Int) -> Int in
	return (x+y)
}
```

- 클로저는 매개변수를 받거나 , 값을 반환하도록 만들 수 있음

```swift
 {(매개변수 이름: 매개변수타입) -> 변환타입 in
	// 코드
 }
```

## 후행클로져

- 클로저가 함수의 마지막 argument 라면 마지막 매개변수명을 생락한 후 함수 소괄호 외부에 클로저를 작성
