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

# Array

```swift
var a = Array<String>()
...is the same as ...
var a = [String]() // String 이 나열된 Array 타입, ()는 초기화


let animals = ["Giraffe", "Cow", "Doggie", "Bird"]
animals.append("Ostrich") // let 이기 때문에 에러
let animal = animals[5] // crash (array index out of bounds)

// 어떻게 Array 를 열거할까?
for animal in animals {
	println("\(animal)")
}
```

## Array 에 있는 메소드

- Array 에서의 연산을 하기 위해 클로져를 사용해

```swift
//1. array 에 있는 무슨 타입이든 받아서 bool을 반환하는 클러져를 제공, 모든 요소마다 클러져 실행 , 클로져가 true 를 반환하는 요소를 포함
filter(includeElement: (T) -> Bool) -> [T]
let bigNumbers = [2,47,118,5,9].filter({ $0 > 20 }) // bigNumber = [ 47, 118 ]
//2. map은 클로져를 받고 클로져는 array 안에 있는 각 요소들을 다른것으로 바꿔버린다.
map(transform: (T) -> U ) -> [U]
let stringified: [String] = [1,2,3].map { String($0) } // Int 배열을 String 배열로 바꾸는거
//3. reduce는 array를 하나의 결과로 줄일 수 있어 . 숫자를 더해가는것
reduce(initial: U, combine: (U,T) -> U) -> U
let sum: Int = [1,2,3].reduce(0) { $0 + $1 }
//4. Dictionary는  키와 값으로 이루어진거
var pac10teamRankings = Dictionary<String,Int>()
... is the same as ...
var pac10teamRankings = [String:Int]()
pac10teamRankings= ["Stanford":1, "Cal":10]
let ranking = pac10teamRankings["Ohio State"] // ranking 은 Int? 가 될거야  //  nil
//열거
for (key,value) in pac10teamRankings {
	print("\(key) = \(value)"
}
```

# String

```swift

var characters: String.CharacterView { get } // 문자의 배열처럼 보이는 문자들을 가져온다.
```

- String 의 메소드

```swift
startIndex -> String.Index
endIndex -> String.Index
hasPrefix(String) -> Bool
hasSuffix(String) -> Bool
capitalizedString -> String
lowercaseString -> String
uppercaseString -> String
componentsSeparatedByString(String) -> [String] // "1,2,3".csbs(",") = ["1","2","3"]
```

```swift
// 1. NSObject : objective-C 클래스들의 기본 클래스
// 2. NSNumber :
// 3. NSDate
// 4. NSData
```
