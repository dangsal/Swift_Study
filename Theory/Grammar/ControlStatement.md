# Control Statement

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
		break // if문 안에 하나일지라도 {} 해줘야해
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

func printName(firstName:String, lastName:String?){
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
