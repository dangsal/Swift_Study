# DataType,var,let

Bool, Character, Int, Float, Double, String, Void

```swift
var myNumber = 10
var myNumber : Int = 10
// 위와 같이 초깃값이 있을 경우에는 컴파일러가 타입 추론(type inference) 을 하므로 데이터 타입을 명시할 필요 없음
var x : Int
x =10 // 에러발생. 양쪽에 일관된 공백필요

print(x)

```

## 정수 데이터 타입 : Int

- 정수를 저장하는데 사용
- 애플은 특정 크기의 데이터 타입 보다 Int 데이터 타입을 권장
- 출력하고싶은변수나 상수 \(출력하고싶은변수나 상수)

## 부동 소수점 데이터 타입 : Double

- 소수점이 있는 숫자
- Float(32비트) 과 Double(64비트) 타입을 제공
- Double형이 기본

## 부울 데이터 타입 : Bool

- 참 또는 거짓 조건을 처리할 데이터 타입
- Boolean 데이터 타입을 처리하기 위하여 두개의 불리언 상수값(True/False)를 사용

## 문자 데이터 타입 : Character

- var 변수명 : Character = "초기값"

## 문자열 데이터 타입: String

- 단어나 문장을 구성하는 일련의 문자
- 저장, 검색, 비교, 문자열 연결, 수정 등의 기능을 포함
  문자열 보간을 사용하여 문자열과 변수, 상수, 표현식 , 함수 호출의 조합으로 만들 수도 있음

# 변수 : var

- 기본적으로 변수는 프로그램에서 사용될 데이터를 저장하기 위한 메모리 공간
- 변수에 할당된 값은 변경 가능

# 상수 : let

- 상수는 한번 할당되면 이후에 변경 될 수 없음

## 상수와 변수 선언하기

- 변수는 var 키워드를 이용하여 선언되며, 변수를 생성할 때에 값을 가지고 초기화 할 수 있음
  var userCount = 10
- 상수는 let 을 사용하여 선언
- 선언하는 시점에서 상수에 값이 할당되어 초기화 되고, 할당된 값을 수정할 수 없음
- 애플은 코드의 효율성과 실행 성능을 높이기 위해서 변수 보다는 상수르 사용하라고 권장

### 타입 어노테이션 & 타입 추론

- 타입 어노테이션: 변수 상수 선언시 타입 지정해주는거
- 타입 추론: 변수 상수 선언시 생략하는거

```swift
let bookTitle: String
var book = true
if book{
	bookTitle = "IOS"
} else{
	bookTitle = "Android"
}
print(bookTitle)
```

## Tuple

- 여러개의 값을 하나의 개체에 일시적으로 묶는 방법
- 튜플에 저장되는 항복들은 어떠한 타입도 될 수 있으며, 저장된 값들이 모두 동일한 타입이어야 한다는 제약도 없음
- let myTuple = (10,12.1,"HI")
- 튜플의 요소들은 여러 다른 방법들을 사용하여 접근 할 수 있음
- 특정 튜플 값은 인덱스 위치를 참조하면 간단하게 접근가능
- 인덱스 2위치를 추출하고 그 값을 새로운 문자열 변수에 할당

```swift
let myTuple = (10,12.1,"HI")
var myString = myTuple.2
print(myString)

// 단 한 줄의 코드로 튜플의 모든 값을 추출하여 변수 또는 상수에 할당
let (myInt,myFloat,myString) = myTuple
// 튜플의 앖을 선택적으로 추출하는데 사용할수 있으며, 무시하고 싶은 값에 밑줄을 사용하면 그 값은 무시
var (myInt, _ ,myString) = myTuple
// 튜플을 생성할 때 각 값에 이름을 할당 할 수도 있음
let myTuple = (count:10, length:12.1, message:"HI")
// 튜플에 저장된 값에 할당된 이름은 각 값을 참조하는데 사용
// myTuple 인스턴스의 message 값을 출력하는 코드
print(myTuple.message)
// 튜플의 가장 강력한 점은 함수에서 여러 값들을 한번에 반환하는것
```

- It is nothing more than a grouping of values.

```swift
let x: (String, Int, Double) = ("hello", 5, 0.85)
let (word, number, value) = x
print(word)
print(number)
print(value)

let x (w: String, i: Int, v: Double) = ("hello", 5, 0.85)
print(x.w)
print(x.i)
print(x.v)
let (wrd, num, val) = x
```

- Returning multiple values from a function

```swift
func getSize() -> (weight: Double, height: Double) { return (250,80) }

let x = getSize()
print(x.weight) // 250
```
