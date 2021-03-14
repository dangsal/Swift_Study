## Views

- 뷰는 사각형 영역이다.
- 뷰는 좌표 공간으로 정의한다. ( 드로잉이나 입력 처리 등을 할때는 정의된 좌표공간이 필요하다.그리고 그 공간은 그리기나 터치 이벤트를 처리하는데 사용된다.)
- 뷰는 위계구조를 가지고있다.
- 드로잉 할때 사용하는 메인 타입 4가지 CGFloat,CGPoint,CGSize,CGRect

### CGFloat

- 드로잉에서는 Double, Float을 쓰지 않아 -> CGFloat 사용할거야.(계산은 double로 하더라도 CGFloat으로 바꿔줘야해)(let cfg = CGFloat(aDouble))

### CGPoint : 2개의 변수만 가짐(x 좌표, y좌표)

### CGSize : 2개의 변수만 가짐(너비와 높이)

### CGRect :

```swift
struct CGRect {
	var origin: CGPoint
	var size: CGSize
}
let rect = CGRect(origin: aCGPoint, size: aCGSize)

```

- 유용한 메소드들이 많다. ex) intersects(CGRect)

## 드로잉을 할 좌표계 (드로잉에 사용되는 모든 단위들은 포인트라고 불림 (픽셀아님))

### Origin 은 좌측상단

- y 증가는 스크린 아래로 움진인다는 뜻

- x 증가는 스크린 오른쪽으로 움직인다는 뜻

## bounds : 드로잉 하는 경계선 CGRect 사용

## frame : CGRect 사용 : 슈퍼뷰 안에서 나의 뷰가 "어디" 에 있는가를 나타낸다. (슈퍼뷰의 좌표계상에서 나의 뷰를 완전히 덮는 직사각형을 말한다.)

### center : 내 뷰의 중간점이 아닌 슈퍼뷰의 좌표계 기준으로 정중앙 표시 CGPoint

- frame 과 center 가 내 뷰의 위치를 지정해 준다. 드로잉과 상관없다 -> 드로잉할때는 bounds 이용
- 드로잉 코드안에 frame 이나 center 사용 x
- frame 과 bounds 의 크기가 같다? 아니야! bounds는 회전할수 있기때문에 그걸 다 덮는 frame 이 있어야해

<img src = "../images/frameandbounds.png" width="500px">

## Creating Views

- 대부분의 경우 스토리보드에서 드래그 해오는 방식으로 만든다.
- 내가 만든 뷰를 스토리보드에 넣으려면 일반적인 뷰(UIView)를 끌어온 다음에 일반화된 뷰를 identity inspector 에서 수정한다. ( 이뷰의 클래스를 바꿔서 UIView의 자식 클래스로 만든다. ) -> 내 뷰에 원하는 그림을 드로잉한다.

- 커스텀 뷰를 어떻게 만들까? -> UIView를 상속받은 다음에 drawRect() 라는 메소드 하나만 override 해주면 그릴 수 있다.(drawRect 는 하나의 인자만 받는데 이건 최적화를 위한 인자다 -> 시스템이 뷰 어느부분을 그리게 하고 싶은지를 말한다.)

### DrawRect 메소드를 절대 호출해서는 안돼!!! -> 시스템(IOS)이 호출할거야

- setNeedsDisplay()
- setNeedsDisplayInRect(regionThatNeedsToBeRddrawn: CGRect ) : 인자로 받는 직사각형 부분만 그리게 해주는 메소드

### UIBezierPath 클래스

- 그리는 메소드 여러개가 있다. lineto, arcs ...
- UIColor 는 선을 긋거나 색을 채울 때 쓰인다.
- stroke() , fill() 은 지원하는 메소드
- 색, 폰트, 텍스트, 이미지 때고 나머지 관련된 것은 다 지원해

## Drawing

```swift
// create a UIBizierPath
let path = UIBezierPath()
// Move around, add lines or arcs to the path
path.moveToPoint(CGPoint(80,50))
path.addLineToPoint((CGpoint(140,150))
path.addLineToPoint((CGPoint(10,150))
// close the path ( if i want )
path.closePath()
// drawRect 에 이 코드를 넣더라도 아무일도 일어나지 않아. why? -> path를 생성한것 뿐. 그리질 않았어
// set attributes and stroke/fill
UIColor.greenColor().setFill()	// note this is a method in UIColor, not UIBezierPath
UIColor.redColor().setStroke()	// note this is a method in UIColor, not UIBezierPath
path.linewidth = 3.0	// note this is a property in UIBezierPath, not UIColor
path.fill()
path.stroke()
```

- roundRect , oval 같은 특정 도형 그리기 있어
- addClip() 모서리 둥글게 할 수 있어
- containsPoint(CGPoint)->Bool Hit detection 가능

### UIColor // 투명도가 있는것 alpha 0 투명해!

- colors are set using UIColor // let green = UIColor.greenColor()
- Background color of a UIView // var backgroundColor: UIColor
- 뷰에서 투명도가 들어간 것을 그린다면(투명한 색상을 그린다면) // var opaque = false
- 뷰를 완전히 숨길 수 도 있어 // var hidden : Bool

## Drawing Text

- UIBezierPath 로 텍스트를 그리지 않아 -> 텍스트는 폰트로 표현되는 UIBezierPath의 모음일 뿐이다.-> 폰트는 UIBezierPath의 모음으로 된 각각의 문자를 정의해 새겨진 문자.-> 텍스트를 그리는 높은 수준의 방법? (사실 UILable 로 많이 사용)

```swift
let text - NSAttributedString("hello")
text.drawAtPoint(aCGPoint) // aCGPoint 를 기준으로 text를 그릴거야
let textSize: CGSize = text.size
// 잘 사용안해 .. objective-c 꺼라 스위프트에서는 복잡해
```

## Drawing Images

- UIImageView 사용
- creating a UIimage object

```swift
// 1.
let image: UIImage? = UIImage(named:"foo") // Images.xcassets file

// 2.
let image: UIImage? = UIImage(contentsOfFile: aString)
let image: UIImage? = UIImage(data: anNsData) // raw jpg, png, tiff, etc

// drawing
let image: UIImage =  ...
image.drawAtPoint(aCGPoint)
image.drawInRect(aCGRect) // Rect 에 맞춰서 비율을 조정
image.drawAsPatternInRect(aCGRect) // 타일을 까는 효과
```

## Redraw on bounds change?

- 세로화면 -> 가로화면? : 디폴트값이 모든 비트의 크기를 조정한다. ( 늘어나거나 줄어들어 )
- UIViewContentMode
  1.  (.Left/.Right/.TopBottom/.TopRight/.TopLeft/.BottomRight/.BottomLeft/.Center) . 컨텐츠를 늘리는게 아니라 새 bounds의 장소로 이동하는거
  2.  크기를 조정할 수 있어 .기본값 ScaleToFill (.ScaleToFilee/.ScaleAspectFill/.ScaleAspectFit )
  3.  .Redraw -> drawRect를 다시 호출

내용은 계속 추가 될 예정입니다.
