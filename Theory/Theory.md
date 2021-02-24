```swift
var myNumber = 10
var myNumber : Int = 10
// 위와 같이 초깃값이 있을 경우에는 컴파일러가 타입 추론(type inference) 을 하므로 데이터 타입을 명시할 필요 없음

Bool, Character, Int, Float, Double, String, Void

var x : Int
x =10 // 에러발생. 양쪽에 일관된 공백필요

print(x)

```

자료형의 종류와 크기

```swift
var x = 10
print(type(of:x))
let s = MemoryLayout.size(ofValue: x)
let t = MemoryLayout<Int>.size
print(s,t)
```

일반적으로 초깃값을 주지 않을 경우에만 자료형을 씀

```swift
var welcomeMessage: String // 초깃값이 없으므로 자료형을 직접 표기함
let meaningOfLife = 42 // meaningOfLife Int형으로 타입 추론됨
let pi = 3.141592 // pi 는 Double형으로 추론됨
let anotheroPi = 3 + 0.14159 // anotherPi 는 Double형으로 추론된
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

- 상수는 한번 할당되면 이후에 변결 될 수 없음

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

## 옵셔널 optional

Optional(10) : Int 형 값을 저장(옵셔널형에 감취져서 저장됨) 또는 값이 없음(nil)

- int?
- int!

```swift
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

```swift
var index: Int? // index 변수는 정수 값을 갖거나 아무 값도 갖지 않을 수 있음(nil)
```

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
	print(xx)
}
else {
	print("nil")
}

var x1 : Int?
if let xx = x1{
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
		print(age+1) // 2
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

## 형 변환 (as 로 upcasting)

- 상속 관계가 있는 클래스들끼리만 타입 캐스팅 가능
- 자식(부모로부터 상속받아 더 많은 것을 가지고 있음) 인스턴스를 부모로 캐스팅하는 것은 문제가 없음
- as 연산자를 이용한 타입 변환(type casting)
- 자식 인스턴스 as 부모클래스 // upcasting 안전한 캐스팅. 자식이 추상화 됨
- 업캐스팅은 객체를 부모 클래스의 객체로 형 변환
- 형 변환은 성공할 것이기 때문에 보장된 변환 (guaranteed conversion)
- UIButton 은 UIControl 의 자식 클래스이므로 안전하게 형 변환
- let myBtn: UIButton = UIButtin()
- let myControl = myBtn as UIButton // 자식인스턴스 as 부모 클래스
- 자식 인스턴스인 myBtn 을 부모 클래스형으로 형 변환

## 형 변환(as! as? 로 downcasting)

- 다운캐스팅은 부모 인스턴스를 자식 클래스로 변환 하는데 사용
- 성공 확신이 있으면 as! 키워드를 사용하여 강제변환 // 반환 실패시 crash
- 성공 확신이 없으면 as? 를 사용하여 안전하게 변환 // 변환이 안되면 nil 을 리턴하므로 옵셔널 타입으로 반환함
- 부모 인스턴스 as! 자식 클래스 // downcasting 일반 타입으로 반환 , downcating이 반드시 성공할 것이라는 확신이 있을때
- 부모 인스턴스 as? 자식 클래스 // downcasting 옵서녈 타입으로 반환, 확신이 없을 경우

## 타입 검사 (is)

- is 키워드를 이용하여 값의 타입 검사
- 지정된 객체가 myclass 라는 이름의 클래스의 인스턴스인지 검사
- 인스턴스가 해당 클래스인가? // 인스턴스 is 클래스
- if myobj is myclass{
  //myobj 는 myclass의 인스턴스이다.
  }

```swift
class A {}
var a = A()
if a is A{
	print("YES")
}
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

## 기본 할당 연산자

- 할당 연사자 (=) 는 두개의 피 연산자를 가짐

```swift
var x: Int? // 옵셔널 Int 변수를 선언함
var y: 10 // 일반 Int 변수를 선언하고 초기화함
x = 10 // 값을 x 에 할당, Optional(10)
x = x! + y // x + y 의 결과를 x에 할당함 , Optional(20)
x = y // y 값을 x에 할당함 , Optional(10)
```

- == : 값을 체크할때
- ===: 포인터가 같냐

- 닫힌 범위 연산자 5...8 (5,6,7,8)
- 반 열린 범위 연산자 5..< 8 (5,6,7)
- One-Sided Ranges

```swift
let names = ["A","B","C","D"]
for name in names[2...]{ // [...2],[..<2]
	print(name) // C ,D
}
```

- 삼항 연산자 x > y ? x: y // 엑스가 와이보다 크면 엑스 작으면 와이

## Nil-Coalescing Operator (Nil 합병연산자) ??

- 옵셔널 변수 ?? nil 일때 할당되는 값
- 옵셔널 변수의 값이 nil 이면 ?? 다음 값으로 할당 됨

```swift
let defaultAge = 1
var age : Int?
age = 3
print(age) //optional(3)
var myAge = age ?? defaultAge
print(myAge) // age 가 nil 이 아니면 옵셔널이 풀려 nil 이면 뒷값 // 3
```

## 조건 - 증가 for 문 (없어진 문법) -- c 언어 스타일 !!!

## for i in 0..<10

```swift
- for _ in 1...5 {
	//
}

```

## while

```swift

while myCount < 1000 {
	//
}
```

## repeat-while

```swift
repeat{
	//
}
while 조건식
```

```swift
var i = 0
repeat{
	i = i-1
	print(i)
} while(i>o)
```

## break

```swift
for i in 1..<10 {
	if i > 5 {
		break // if 문 안에 하나일지라도 {} 해줘야해
	}
	print(i)
}
```

## continue

- 반복문에서 continue 문 이후의 모든 코드를 건너뛰고 반복문의 상단 시작 위치로 돌아감

```swift
for i in 1...10 {
	if i % 2 == 0 {
		continue
	}
	print(i)
}
```

## if

- if 문 다음의 실행코드가 한 줄이라도 있을경우 {} 필수적으로 사용해야한다.
- 조건은 () 해도 되고 안해도 되는데 일반적으로 안해

## if - else

## guard문 (조건식이 거짓이면 실행)

```swift

fuc printName(firstName:String, lastName:String?){
	if let lName = lastName {
		print(lName, firstName)
	}
	else {
		print("성이 없네요")
	}
	//
	guard let lName = lastName else{
		print("성이 없네요!")
		return  // 조기 탈출
	}
	print(lName,firstName)
}
printName(firstName: "길동" , lastName: "홍")
```

## switch-case

- 각 케이스 마지막에 break 가 자동으로 들어있음

```swift
var value = 0
switch (value)
{
	case 0:
		print("영")
	case 1:
		//
	case 2,3,4,5,6,7:
		//
	case 10...99
		// 두자리 수이다.
	default:
		//
}
```

- 부가적은 조건을 추가하기 위하여 사용 where

```swift
switch (value)
{
	case 0...49 where value % 2 == 0 :
		//
}
```

- fallthrough : 계속 아래로 내려가게하기

```swift
var value = 0
switch (value)  // 4
{
	case 0:
		print("영")
	case 1:
		//
	case 2,3,4,5,6,7:
		//
	case 10...99
		// 두자리 수이다.
	default:
		//
}
// 	case 2,3,4,5,6,7 이하로 다 나와
```

## 함수

- 특정 작업을 수행하는 코드 블럭
- 함수에서 받을 때 사용하는 변수 : parameter
- 함수를 호출할때 사용하는 인수 : argument

## 메서드

- 특정 클래스, 구조체, 열거형 내의 함수
- 함수를 스위프트 클래스 내에 선언하면 메서드라 부름
- 클래스, 구조체, 열거형 안에 들어있는 함수

## 함수를 선언하는 방법

```swift

func sayHello() {  // -> Void 생략가능
	print("Hello")
}

sayHello()

func message(name: String , age: Int) -> String {
	return ("\(name) \(age)")
}

func add(x: Int , y: Int) -> Int {
	return (x+y)
}

add(x:10 , y:20) // 외부매개변수를 생략 가능

print(add(x:10 , y:20))
```

## 내부 매개변수 이름과 외부 매개변수 이름

```swift
func add(first x: Int, second y : Int) -> Int {
	// first , second 는 외부매개변수 x, y는 내부 매개변수
	return (x+y)
}
add(first: 10, second:20) //add(x: 10, y:20) 는 오류 , 함수 호출을 할 때는 외부 매개변수명을 사용
```

## 디폴트 매개변수( 아규먼트 )정의하기

- 함수를 정의할때 ex) name: String = "성호" 처럼 디폴트 값이 있다.

## 함수로 부터 여러 개의 결과 반환 하기

- 함수는 여러 결과 값들을 튜플로 감싸서 반환할 수 있ㅎ음

```swift
func converter(length: Float) -> (yards: Float, centimeters: Float, meters: Float){
	let yards = length * 1
	let centimeters = length * 2
	let meters = length * 3
	return (yards, centimeters, meters)
}

var lengthTuple = converter(length: 20)
print(lengthTuple.yards)
```

```swift
func sss(n1: Int , n2: Int) -> (sum: Int , sub : Int , div : Double){
	let sum = n1 + n2
	let sub = n1 - n2
	let div = Double(n1) / Double(n2)
	return (sum , sub, div)
}

var result = sss(n1: 10 , n2:3)
print(result.sum)

print(String(format: "%.3f",result.div))
```

## 가변 매개변수

- 함수가 지정된 데이터 타입으로 0개 또는 그 이상의 매개변수를 받는다는 것을 가리키기 위해서 점 세개 (...) 을 이용하여 선언

```swift
func displayString(string[]s: String...){
	for string in strings {
		print(string)
	}
	displayStrings(strings: "일", "이", "삼", "사")
}
```

## inout 매개변수 call by reference 구현

- 함수가 값을 반환한 후에도 매개변수에 일어난 변화를 유지하려면, 함수의 선언부에서 매개변수를 입출력 매개변수(inout parameter)로 선언해야함

## 함수를 매개변수로 사용

- 스위프트는 함수를 데이터 타입처럼 처리할 수 있음
- 다음과 같이 함수를 상수 또는 변수에 할당하는 것이 가능

```swift
func inchesToFeet (inches:Float) -> Float {
	return inches * 0.83333
}
let toFeet = inchesToFeet // 함수를 자료형 처럼 사용

```

- 함수를 호출 하려면 원래의 함수 이름 대신에 상수 이름을 이용하여 호출 가능 var result = toFeet(10) //inchesToFeet(10)
- 어떤 함수에 다른 함수를 인자로 넘겨주거나 함수의 반환 값으로 함수를 넘겨줄 수 있음
- 위 함수는 Float 형 매개변수, Float형 결과를 반환하기 때문에 함수의 데이터 타입(자료형)
- Int 와 Dobule형을 매개변수로 받아서 String 을 반환 하는 함수의 데이터 타입
- 매개변수로 함수를 받으려면, 함수를 받게 될 함수는 함수의 데이터 타입을 선언함

## 함수를 매개변수나 리턴값으로 사용할수 있다.

- swift의 함수는 1급 객체이다. 1급 객체 또는 1급시민 다음 조건을 충족하는 객체를 1급 객체라고 한다.

1. 변수에 저장할 수 있다.
2. 매개변수로 전달 할 수 있다.
3. 리턴값으로 사용 할 수 있다.

## 클로저 표현식

```swift
func add(x: Int , y: Int) -> Int {
	return (x+y)
}
print(add(x:10,y:10)
 // 위는 일반 함수 아래는 클로저
let add1 = { (x: Int , y: Int) -> Int in
	return (x+y)
}

print(add1(10,20))
```

- 함수의 이름이 없다.

## 후행 클로저 (trailing closure)

- 클로저가 함수의 마지막 argument 라면 마지막 매개변수 이름을 생략한 후 함수 소괄호 외부에 클로저를 구현

## 클래스 vs 객체 vs 인스턴스

클래스(개) -> 인스턴스(멍멍이) , 인스턴스(해피) , 인스턴스(메리)

- 클래스로부터 만들어진 객체를 인스턴스라고 한다.
- 자동차라는 클래스 안에 문 핸들 바퀴 의자 라는 인스턴스(객체) 인 프로퍼티가 있고 , 움직이고 정차하고 감속하는 특징인 행위 즉 메소드라고 한다.

## 클래스와 구조체 ( 면접 단골 질문 )

- 나중에 찾아서 정리 하기

## 객체 인스턴스

1. 인스턴스(instance)

- 실제로 메모리에 할당된 객체(object)
- 소프트웨어 애플리케이션을 개발하는데 사용되는, 쉽게 사용할 수 있으며 재사용 할 수 있는 기능을 가진 모듈
- 객체의 구성 : 데이터변수(data variable) 또는 속성 (property) , 함수 또는 메서드(method)

2. 클래스 란 무엇인가?

- 클래스는 객체가 생성되었을 때 어떠한 모습을 보일 것인지를 정의
- 메소드는 어떠한 일을 하고 어떠한 속성이 있는지 등을 정의
- int x;
- Student han;
- 클래스 인스턴스;

### 스위프트 클래스 선언하기

```swift

class 새로운 클래스 이름: 부모 클래스 {
	//프로퍼티
	// 인스턴스 메서드
	// 타입 메서드(클래스 메서드)
}
```

- 프로퍼티 부분은 클래스 내에 포함되는 변수 와 상수를 정의한다. var, let
- 인스턴스 메서드는 객체가 호출하는 메서드를 정의한다.
- 타입 메서드는 클래스가 호출하는 메서드를 정의한다.

### 클래스에 프로퍼티 추가하기

1. 프로퍼티는
   - 초기값이 있거나 (처음에 정의)
   - init 을 이용해서 초기화하거나
   - 옵셔널 변수(상수) 로 선언
2. 프로퍼티는 저장 프로퍼티와 계산 프로퍼티가 있다.
3. age, weight 는 저장 프로퍼티( 저장 프로퍼티는 초기값 필요 )

```swift
class Man{
	var age: Int = 0
	var weight: Double = 0.0
}

class Woman{
	var age: Int? // 자동으로 초기값 안줬기 때문에 nil
	var weight: Double!
}
```

### 클래스에 메서드 추가하기

- 메서드 정의
  1.  인스턴스 메서드, 클래스 또는 타입 메서드
  2.  인스턴스 메서드는 인스턴스에서 동작

```swift
class Man{
	var age: Int =1
	var weight : Double = 3.5
	func display(){ // 인스턴스 메서드
		print("나이는 \(age), 몸무게는 \(weight)")
	}
}
```

## 인스턴스 만들고 메서드와 프로퍼티 접근

```swift
class Man{
	var age: Int =1
	var weight : Double = 3.5
	func display(){ // 인스턴스 메서드
		print("나이는 \(age), 몸무게는 \(weight)")
	}
}

var x : Int
//var kim : Man // initailized 필요함
var kim : Man = Man() // 객체를 만들때는 이렇게 써줘야해
// var Kim = Man() 이라고 해도 됨 // Man 클래스의 생성자를 호출해주세요 라는 뜻
print(kim.age)
kim.display()
```

## 클래스 메소드 (타입 메서드)

- 클래스명.클래스메서드()
- 타입메서드 또는 클래스 메서드는 클래스 레벨에서 동작하는 것으로, 클래스의 새로운 인스턴스를 생성하는 것과 같은 동작
- 타입 메서드는 인스턴스 메소드와 도ㅓㅇ일한 벙법으로 선언하지만 class 나 static 키워드를 앞에 붙여서 선언
- class 키워드로 만든 클래스 메서드는 자식 클래스에서 override(자식꺼를 우선적으로 하는것) 가능함

```swift
class Man{
	var age: Int =1
	var weight : Double = 3.5
	func display(){ // 인스턴스 메서드
		print("나이는 \(age), 몸무게는 \(weight)")
	}
	class func cM{
		print("cM은 클래스메서드입니다.")
	}
	static func scM{
		print("scM은 클래스 메소드(static)입니다.")
	}
}
var kim : Man = Man()
kim.display() // 인스턴스 메서드는 인스턴스가 호출
Man.cM() // 클래스 메서드는 클래스가 호출
Man.scM() // 클래스 메서드는 클래스가 호출
```

## 생성자 Initialization , 인스턴스 초기화하기 : init()

1. 클래스, 구조체, 열거형(enum) 인스턴스가 생성되는 시점에서 해야 할 초기화 작업
2. 인스턴스가 만들어지면서 자동 호출됨
3. init 메서드(생성자)

```swift
init(){

}
```

4. designated initializer - 모든 프로퍼티를 다 초기화 시키는 생성자
5. 소멸자 - 인스턴스가 사라질때 자동 호출 되고, denite{}

```swift
class Man{
	var age: Int =1 // 초기값 없어도 돼 이제
	var weight : Double = 3.5  // 초기값 없어도 돼 이제
	func display(){ // 인스턴스 메서드
		print("나이는 \(age), 몸무게는 \(weight)")
	}
	init(yourAge: Int , yourWeight: Double){
		age = yourAge
		weight = yourWeight
	} // designated initializer
	deinit{

	}
}

var x : Int
// var kim : Man = Man() // init() 을 하나라도 직접 만들면 default initializer 는 사라짐

var kim : Man = Man(yourAge: 10 , yourWeight: 20.5)
print(kim.age)
kim.display()
```

### self

1. 현재 클래스 내 메서드나 프로퍼티를 가리킬 때 메서드나 프로퍼티 앞에 self.을 붙임

```swift
class Man{
	var age: Int = 1
	var weight : Double = 3.5
	func display(){
		print("나이는 \(age), 몸무게는 \(weight)")
	}
	init(age: Int, weight: Double){
		self.age = age  // age 가 어디껀지 알아야해서 self 써야해 age = age 라고 하면 안대.
		self.weight = weight
	}
}
var kim: Man = Man(age: 10, weight: 20.5)
kim.display()
```

## stored property 와 computed property

- computed property는 property 가 설정되거나 검색되는 시점에서 계산 또는 파생된 값
- 계산 프로퍼티 내에는
  1.  값을 리턴 하는 게터(getter) 메서드
  2.  값을 대입하는 세터 (setter) 메서드
- manAge 는 게산 프로퍼티로 저장 프로퍼티 age 의 값에서 1을 뺀 값으로 하겠다는 것임

```swift
class Man{
	var age: Int = 1 //stored property
	var weight : Double = 3.5 // stored property
	var manAge: Int { // 메서드는 같지만  computed property
		get {
			return age-1
		}
		set(USAAge){
			age = USAAge + 1
		}
	}
	func display(){
		print("나이는 \(age), 몸무게는 \(weight)")
	}
	init(age: Int, weight: Double){
		self.age = age  // age 가 어디껀지 알아야해서 self 써야해 age = age 라고 하면 안대.
		self.weight = weight
	}
}
var kim: Man = Man(age: 10, weight: 20.5)
kim.display()
print(kim.manAge) // getter 호출
kim manAge = 3 // setter 호출
```

- setter 가 없다면 get{} 는 생략할 수 있으며 변경하지 않더라도 var 로 선언해야함
- setter 매개변수명이 newValue 인 경우이만 매개변수 생략가능

### method overloading : 생성자 중첩 - 생성자를 여러개 쓰면 돼

- 매개변수의 개수와 자료형이 다른 같은 이름의 함수를 여러 개 정의
- 매개변수가 다른 두 생성자를 통해 두 가지 방법으로 인스턴스를 만들 수 있음

```swift
class Man{
	var age: Int = 1
	var weight : Double = 3.5
	func display(){
		print("나이는 \(age), 몸무게는 \(weight)")
	}
	init(age: Int, weight: Double){
		self.age = age
		self.weight = weight
	}
	init(age: Int){
		self.age = age
	}
}
var kim: Man = Man(age: 10, weight: 20.5)
var lee: Man = Man(age: 10)
kim.display()
lee.display()
```

## failable initializer

https://www.youtube.com/watch?v=9dZZ8AAZRRc&list=PLJqaIeuL7nuFbWKMhG8-xLzF1T7gIPr8Z&index=61

## 상속 Inheritance

- 남들이 만들어 둔 클래스 사용 중요!!
- superclass 부모 class - subclass 자식 class

### 부모 클래스와 자식 클래스

1. 상속된 클래스는 부모 클래스의 모든 기능을 상속받으며, 자신만의 기능을 추가
2. 상속받은 클래스들을 하위 클래스또는 자식 클래스라 부른다.
3. 하위 클래스가 상속받은 클래스는 부모 클래스 또는 상위 클래스라 부른다.
4. 단일 상속 - 스위프트 에서 하위 클래스는 단 하나의 부모 클래스만 상속 받을 수 있다.

### 스위프트 상속

```swift
class 자식 : 부모 {

}
```

- 부모 클래스는 하나만 가능
- 콜론 다음이 여러 개이면 나머지는 프로토콜
- class 클래스명: 부모명, 프로토콜명{}
- class 클래스명: 부모명, 프로토콜명1, 프로토콜명2 {}
- class 클래스명: 프로토콜명{}
- class 클래스명: 프로토콜명1, 프로토콜명2{}
- 상속은 클래스만 가능
- 클래스 구조체 열거형 extension 에 프로토콜을 채택 할 수 있다.

## 상속 : 부모가 가진 것을 물려받는다.

### super : 부모 메서드 호출 시 사용

```swift
class Man{
	var age: Int = 1
	var weight : Double = 3.5
	func display(){
		print("나이는 \(age), 몸무게는 \(weight)")
	}
	init(age: Int, weight: Double){
		self.age = age
		self.weight = weight
	}
}


class Student : Man {
	var name : String = "이성호"
	func displayS(){
		print("나이는 \(age), 몸무게는 \(weight), 이름은 \(name)입니다.")
	}
	init(age: Int , weight: Double , name:String){
		super.init(age:age, weight:weight)
		self.name = name
	}
}

var lee : Student = Student(age:20 , weight:65.2 , name: "이성호")
lee.displayS()
```

## overriding - 부모와 자식에 같은 메서드가 있으면 자식 우선

```swift
class Man{
	var age: Int = 1
	var weight : Double = 3.5
	func display(){
		print("나이는 \(age), 몸무게는 \(weight)")
	}
	init(age: Int, weight: Double){
		self.age = age
		self.weight = weight
	}
}
class Student : Man {
	var name : String = "이성호"
	override func display(){
		print("나이는 \(age), 몸무게는 \(weight), 이름은 \(name)입니다.")
	}
	init(age: Int , weight: Double , name:String){
		super.init(age:age, weight:weight)
		self.name = name
	}
}

var lee : Student = Student(age:20 , weight:65.2 , name: "이성호")
lee.display()
```

- 부모와 자식에 display()라는 메서드가 있어서 student 클래스는 display() 메서드가 두개임
- student 클래스의 인스턴스 lee 가 display() 를 호출할때 자식클래스가 새로 만든 display() 메서드가 우선적으로 호출되려면 func 앞에 override 키워드를 씀

### 익스텐션 (extension)

1. 스위프트 클래스, 구조체 , 열거형 , protocol 에 새로운 기능 을 추가
2. 익스텐션은 하위 클래스를 생성하거나 참조하지 않고 기존 클래스에 메서드 , 생성자( initializer), 계산 프로퍼티 등의 기능을 추가하기 위하여 사용

```swift
extension 기존타입이름 {
	// 새로운 기능
}

```

```swift

extension Double{
	var squared : Double {
		return self * self
	}
}

let a : Double = 3.0
print(a.squared)
print(4.0.squared)
```

## Swift 접근 제어 (access control , access modifier)

1. 접근 속성(접근 수정자, 액세스 수정자, 액세스 지정자) 는 클래스 , 메서드, 멤버의 접근 가능성을 설정하는 객체지향 언어의 키워드
2. 구성 요소를 캡슐화하는데 사용
3. 5개 접근 있음 // 높은 접근순-> open -> public -> internal(기본, 생략 가능)ㅇㅌㄴㅇㅇ -> fileprivate -> private -> 낮은 접근순

- open : Free
- public : 다른 스위프트 파일에서도 가능
- fileprivate : 현재 소스파일내에서만 사용 가능
- private : 현재 블럭내에서만 사용 가능

## protocol

1. 특정 클래스와 관련없는 프로퍼티 ,메서드 선언 집합

- 함수(메서드) 정의는 없음
- 기능이나 속성에 대한 설계도
- 클래스(구조체, 열거형) 에서 채택(adopt) 하여 메서드를 구현해야함

2.  스위프트 상속과 프로토콜 채택

```swift
class 자식 : 부모 {

}
// 부모 클래스는 하나만 가능하며 여러개라면 나머지는 프로토콜
```

```swift
protocol 프로토콜명{
	프로퍼티명
	메서드 선언 // 메서드는 선언만 있음 , 클래스는 메서드 정의가 되어있어
}
protocol 프로토콜명 : 다른 프로토콜, 다른프로토콜2 {
	// 프로토콜은 다중 상속도 가능
}

//
protocol SomeProtocol {
	var x : Int { get set } // 읽기와 쓰기가 가능
	var y : Int { get } // 읽기 전용
	static var tx : Int { get set }
	static func typeMethoid()
	func random() -> Double // {} 기능이 없음 프로토콜은
}
```

```swift
protocol Runnable {
	var x : Int { get , set }
	func run()
}

class Man : Runnable {   // 채택
	var x : Int = 1		// 준수
	func run(){
		print("달린다.")
	} // 준수
}

// class Man 에 x, run() 정의 없다면
```

```swift
protocol B {
	func bb(x: Int) -> Int
}

class C{}
class A : C , B{ // 프로토콜은 상속이 아니라 채택받는거야!!!!!!!

	func bb(x: Int) -> Int {
		return ( 2 * x )
	}
}

let a : A = A() // 객체만드는거
a.bb(x:3)


```

## 열거형(enum)

1. 관련있는 데이터들이 멤버로 구성되어 있는 자료형 객체
   - 원치 않는 값이 잘못 입력되는 것을 방지
   - 입력 받을 값이 한정되어 있을 때
   - 특정 값 중 하나만 선택하게 할 때
2. 색깔
   - 빨강, 녹색, 파랑
3. 성별
   - 남, 여

```swift
enum Planet {
	case 수, 금, 지, 화 , 천 , 해  // 하나의 case 문에 멤버들 나열하는것도 가능

}

enum Compass {
	case N
	case S
	case E
	case W
}

print(Compass.N)  // 	N
var direction = Compass.W
direction = .E
```
