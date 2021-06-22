## 함수

- 특정 작업을 수행하는 코드 블록
- 함수 정의부의 값을 매개변수 , 호출시의 값은 아규먼트라고 부름

## 메소드

- 함수를 클래스 내에 선언하면 메서드라 부름

```swift
func message(name: String, age: Int) -> String {
	return ("~~")
}
```

- 외부내부함수

```swift
func add(first x: Int, second y: Int) -> Int{
	return (x + y)
}

add(first: 10, second: 15)
```

- 함수를 자료형으로 사용

```swift
func inchesToFeet (inches: Float) -> Float {
	return inches * 0.8333
}

let toFeet = inchesToFeet // 함수를 자료형처럼 사용가능

var result = toFeet(10)
```
