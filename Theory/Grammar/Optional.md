# 옵셔널 optional

Optional(10) : Int 형 값을 저장(옵셔널형에 감취져서 저장됨) 또는 값이 없음(nil)

```swift
var y : int? = 10 // y = Optional(10)
var z : int! // z = Optional(10)
print(Int("100"))   -> Optional(100)
print(Int("100")!)  -> 100
print(Int("Hi"))    -> nil
print(Int("Hi")!)   -> program down...
```

- 옵셔널 데이터 타입은 다른 프로그래밍 언어네는 없는 새로운 개념
- 값을 반환할때 오류가 발생할 가능성이 있는 값은 옵셔널 타입이라는 객체로 감싸서 반환함
- Swift 에서 기본자료형(Int, Double, String 등) 은 nil 값을 저장 할 수 없음
- nil 도 저장하려면 옵셔널 탕비으로 선언해야 함
- 옵셔널 타입은 변수 또는 상수에 아무런 값이 할당되지 않는 상황을 안전하게 처리하기 위한 방법 제공
- 옵셔널 타입 변수를 선언하기 위해서는 타입 선언부 뒤에 ? 를 쓴다. (변수명 뒤에 ? 하는거 아님)
- index 라는 이름의 옵셔널 Int 변수를 선언

## 옵셔널 타입 강제 언래핑(forced unwrapping) 1

- 옵셔널 변수에 값이 있으면 옵셔널로 "래핑되었다(wrapped)고 함
- 옵셔널에 래핑된 값은 강제 언래핑(forced unwrapping)으로 풀어줌

```swift
var x : Int? // 옵셔널 정수형 x 선언
var y : Int = 0
x = 10                 // 이게 주석처리가 되면 print(x!) 에서 오류 발생.. 없는데 뭘 언래핑해서 보여주라는거야
print(x)               -> Optional(10)
print(x!)              -> 10 // forced unwrapping
print(y)               -> 0
x = x+2                -> Optional(10) + 2 불가 오류
y= x				   -> 타입 충동 오류
```

- 옵셔널형 선언: 자료형 뒤?
- 옵셔널 언래핑: 변수명 뒤! -> 변수가 nil 이 아닐때만

```swift
var x : Int?
x = 10
if x != nil {
	print(x!)
}
else {
	print("nil")
}
var x1 : Int?              // x1 == nil
if x1 != nil {
	print(x1!)
}
else {
	print("nil")
}                 // if x!=nil 하면 안됨     x! = nil 로 인식
```

## 옵셔널 타입 강제 언래핑(forced unwrapping) 2 : optional bingding

- 강제 언래핑 하는 또 다른 방법으로 , 옵셔널 바인딩을 이용하여 옵셔널에 할당된 값을 임시 변수 또는 상수에 할당

```swift
if let constantname = oprionalName{
	//옵셔널 변수가 값이 있다면 언래핑해서 일반 상수 constantname 에 대입하고 if 문 실행
	//값이 없다면 if 문의 조건이 거짓이 되어 if문을 실행하지 않음
}

if var variablename = optionalName{
	// 옵셔널 변수가 값이 있다면 언래핑해서 일반 변수 variablename 에 대입하고 if 문 실행
	// 값이 없다면 if 문의 조건이 거짓이 되어 if 문을 실행하지 않음
}

var x : Int?
x = 10
if let xx = x {
	print(xx) // 10
}
else {
	print("nil")
}

var x1 : Int?
if let xx = x1{ // nil 이기 때문에 else 문 실행
	print(xx)
}
else {
	print("nil")
}
```

## 여러 옵셔널 변수를 한번에 언래핑 하는 방법은 콤마를 사용

```swift
var pet1: String?
var pet2: String?
pet1 = "cat"
pet2 = "dog"
if let firstPet = pet1, let secondPet = pet2 {
	print(forstPet, secondPet)
} else {
	print("nil")
}
```

## 두가지 옵셔널 타입

- 옵셔널이 항상 유효한 값을 가질 경우 옵셔널이 암묵적인 언래핑(implicitly unwrapped)이 되도록 선언 할 수도 있다.
- 클래스의 아웃렛 변수 초기화에서 많이 사용(자동생성되는코드)
- 이러한 방법으로 옵셔널이 선언된다면 강제 언래핑이나 옵셔널 바인딩을 하지 않아도 값에 접근할 수 있음
- 암묵적인 언래핑으로 옵셔널을 선언하기 위해서는 선언부에 물음표 대신 느낌표를 사용

```swift
var x: Int? // 옵셔널 변수 선언방법 1
var y: Int! // 옵셔널 변수 선언방법 2

let a : Int! = 1
let b : Int = a
let c : Int = a!
let d = a
let e = a + 1
print(a,b,c,d,e)         -> Optional(1), 1,1,Optional(1),2
```

## Int!형을 property 로 갖는 클래스

```swift
class MyAge{
	var age : Int!
	init(age: Int) {
		self.age = age
	}

	func printAge() {
		print(age) //optional(1)
		print(age+1) // 2 , age! + 1 라고 쓰지 않아도 됨
		let age1 : Int = age
		print(age1) //1
		let age2 = age + 2
		print(age2) //3
	}
}

var han = Myage(age:1)
han.printAge()
```

## 왜 옵셔널을 사용할까?

- 옵셔널 타입만이 값을 갖지 않는다는 의미의 nil 값을 가질 수 있다.
- nil 값을 옵셔널이 아닌 변수나 상수에 할당 할 수 없다.

```swift
var myInt = nil //error
var myInt : Int? = nil // ok
var myInt : int? //ok
var mystring : String = nil  //error
let myConstant = nil //error

```

```swift
var serverResponseCode: Int? = 404 // Int value of 404
serverResponseCode = nil // no value
```

- 옵셔널 변수에 nil을 할당하면 값이 없는 상태가 된다.
- 상수나 변수가 값이 없는 상태가 존재한다면 옵셔널 타입으로 선언해야 한다.
- 옵셔널 변수에 초깃값을 할당하지 않으면 자동으로 nil 이 할당됨
- An optional is just an enum

```swift
enum Optional<T> {
	case None
	case Some(T)
}
let x: String? = nil
...is ...
let x = Optional<String>.None

let x: String? = "hello"
...is ...
let x = Optional<String>.Some("hello")

var y = x!
...is ...
switch x {
	case Some(let value): y = value
	case None: // 충돌
}

let x: String? = ...
if let y = x {
	// do something with y
}
...is...
switch x {
	case .Some(let y): // do something with y
	case .None: break
}
```

- optionals can be "chained"

```swift
var display: UILabel?
if let label = display {
	if let text = label.text {
		let x = text.hashValue
		...
	}
}
...or...

if let x = display?.text?.hashValue{...}
```

- There is also an Optional "defaulting" operator ??

```swift
let s: String? = ... // might be nil
if s != nil {
	display.text = s
} else {
	display.text = " "
}
...or ...

display.text = s ?? " "
```

## Any , AnyObject

### AnyObject(protocol)

- 범용타입
- 상속관계가 아니더라도 타입 캐스팅 가능한 타입
- 어떤 클래스의 객체도 저장 가능
- 가장 추상화된 최상위 개념
- 클래스만 허용하며 구조체나 열거형은 허용하지 않음

### Any

- 클래스 , 구조체, 열거형, 함수타입도 가능
