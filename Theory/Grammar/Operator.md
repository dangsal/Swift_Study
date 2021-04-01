# 연산자

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

## 형 변환(as! as? 로 downcasting) 중요

- 다운캐스팅은 부모 인스턴스를 자식 클래스로 변환 하는데 사용
- 성공 확신이 있으면 as! 키워드를 사용하여 강제변환 // 반환 실패시 crash
- 성공 확신이 없으면 as? 를 사용하여 안전하게 변환 // 변환이 안되면 nil 을 리턴하므로 옵셔널 타입으로 반환함
- 부모 인스턴스 as! 자식 클래스 // downcasting 일반 타입으로 반환 , downcating이 반드시 성공할 것이라는 확신이 있을때
- 부모 인스턴스 as? 자식 클래스 // downcasting 옵서녈 타입으로 반환, 확신이 없을 경우 (대부분 이걸 사용)

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
