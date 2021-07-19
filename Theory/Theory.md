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

- 독립적인 코드 블록

```swift
func add(x: Int , y: Int) -> Int {
	return (x+y)
}
print(add(x:10,y:10)

 // 1. func add 를 지우고 {} 를 붙인다.
 // 2. Int -> {} 에서 {}를 지우고 in을 붙인다.
 // 3. let add1 = 처럼 새 변수에 넣어준다.

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
- 타입 메서드는 인스턴스 메소드와 동일한 벙법으로 선언하지만 class 나 static 키워드를 앞에 붙여서 선언
- static : class 키워드로 만든 클래스 메서드는 자식 클래스에서 override(자식꺼를 우선적으로 하는것) 가능함

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

4. designated initializer - 모든 프로퍼티(age,weight)를 다 초기화 시키는 생성자
5. 소멸자 - 인스턴스가 사라질때 자동 호출 되고, deinit{}

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

var kim = Man(yourAge: 10 , yourWeight: 20.5)
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
- 상속은 클래스만 가능★
- 클래스 구조체 열거형 extension 에 프로토콜을 채택 할 수 있다.

## 상속 : 부모가 가진 것을 물려받는다.

### super : 부모 메서드 호출 시 사용 ★

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


## Designated Initializer(지정 이니셜라이져) and Convenience Initializer(편의 이니셜라이져)
- 클래스의 프로퍼티는 초기값이 있거나 옵셔널 변수(상수) 로 선언  (init() 없다면 오류)

### Designated initializer : 인스턴스 초기화하기 init() 함수
- 모든 프로퍼티를 다 초기화 시키는 생성자
- 초기화되지 않은 프로퍼티가 있을 경우 클래스에 반드시 1개 이상 필요

```swift
init(age: Int , weight: Double , name:String){
    super.init(age:age, weight:weight)
    self.name = name
}
```

### Convenience initializer( 편의 이니셜 라이져 )
- 보조 이니셜 라이져
- 일부 프로퍼티만 초기화(단독으로 초기화 불가능)
- 다른 이니셜라이져를 이용해서 초기화(initializer delegation) Ex) self.init()
- 다양한 방법으로 객체 만들 수 있도록 편의를 제공하려면 init 을 오버로딩해야 하고 코드 중복이 발생
- 코드 중복 방지



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

## Any, AnyObject

### Any

1. 어떤 타입도 수용가능

```swift
var someAny: Any = 100
```

### AnyObject

1. 모든 클래스 타입을 지칭하는 프로토콜

```swift
class SomeClass{}

var someAnyObject: AnyObject = SomeClass()
```
