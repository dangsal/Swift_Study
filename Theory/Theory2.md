# Optional

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

# Tuple // 타입이야

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

## Range : A Range in Swift is just two end points

```swift
struct Range<T> {
	var startIndex : T
	var endIndex : T
}

// String 의 Range 는 Int 가 아니다.

let array = [ "a", "b", "c" , "d"]
let subArray1 = array[2...3] // ["c", "d"]
let subArray2 = array[2..<3] // ["c"]
for i in 27...104 {} // 27 ~ 103
```

# Data Structures in Swift

```swift
// 공통점
// 1. 생긴형태가 비슷
// 2. 프로퍼티와 함수를 가질 수 있음   , enum 은 저장 프로퍼티를 가질 수 없어(계산 프로퍼티는 가능)
// 3. Initializer 를 가질 수 있음 , enum 은 초기화 함수가 필요가 없어

// 차이점
// 1. 상속 class 만 상속가능
// 2. struct enum 은 값으로 전달되는 값 타입 , class 는  참조타입으로 포인터(메모리주소)로 전달되고 힙 메모리에 있다.

class CalculatorBrain {}

struct Vertex {}

enum Op {}

// Choosing whichh to use? -> 대부분은 클래스를 더 많이 사용, 구조체는 좀 더 근본적인 타입으로 사용될것
// 구조체 사용: 클래스보다는 더 작고 스스로 자립하며 값으로 복사되는게 되고 값 타입을 원하는 영역들
```

# Methods

- 함수에 들어가는 모든 파라미터는 외부이름과 내부이름이 있다. (외내 순서)
- 내부 이름은 메소드 내부에서 사용될 지역 변수의 이름이다.
- 외부 이름은 메소드를 호출할 때 호출하는 사람이 사용한다.
- 외부 이름으로 \_ 를 사용할 시 외부 이름은 보이지 않음
- 첫번째 파라미터에는 언더바가 기본으로 설정되어 있어서 함수를 새로 만들때 언더바를 넣어줄 필요가 없다.
- 다른 파라미터들은 기본값이 내부 이름이다. 외부이름을 지정하지 않으면 내부이름이 기본값이 된다.
- 메소드는 오버라이드 할수 있어. (오버라이드: 상위클래스에서 정의된 메소드와 프로퍼티를 재정의 )
- final 을 사용하면 서브클래싱 할 수 없게 한다.(서브클래싱: 하위 클래스에서 오버라이드 등을 통해 수정하는것)
- 타입 인스턴스 모두 프로퍼티와 메소드를 가질 수 있어.

# Properties

- 프로퍼티의 변화를 감시 할 수 있다.(willSet, didSet)

```swift
var someStoredProperty: Int = 42 {
	willSet {newValue is the new value}
	didSet {oldValue is old value}
}

override var ingeritedProperty {
	willSet {newValue is the new value}
	didSet {oldValue is old value}
}
```

- Lazy Initialization : var 가 늦게 초기화 되도록 선언할 수 있어.

```swift
lazy var brain = CalculatorBrain() // 이 부분이 누군가가 brain 에게 요청하기 전까진 할당되지 않는다.
```
