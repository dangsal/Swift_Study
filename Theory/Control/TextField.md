## Text Field

: 사용자로 부터 입력을 받을 때 사용하는 대표적인 컨트롤(싱글라인받는데 최적화)

### Border Style 3가지

: 기본적으로 회색 border(roundedRect) - 높이가 고정되어있다

    1. 베젤스타일 - 너비와 높이 모두 조절 가능
    2. 라인스타일 - 기본스타일과 큰 차이점은 없다.
    3. 보더생략 - 커스머마이징할때 사용.

: Background : 텍스트필드의 백그라운드 이미지 설정가능 (roundedRect는 백그라운드 이미지 무시, 나머지 모든 스타일에서는 보더 스타일을 무시하고 이미지 표시.)
: Disabled : 비활성화 상태일때 백그라운드 이미지 설정 가능

### Overlay View

: 삭제버튼 처럼 텍스트 필드 안에 보여지는 뷰(텍스트필드 왼쪽과 오른쪽 하나씩 설정가능.)

- clear Button 옵션 -> is always visible 선택하면 텍스트 필드에 삭제버튼 추가된다.
  clear when editing begins 체크하면 편집할때 초기화 된다. (인터페이스빌더에서 유일하게 추가 가능 )
- 나머지는 코드로 구현

```swift
@objc func showPredefinedValue(){
	...
}

let btn = UIButton(type: .custom)
btn.frame = CGRect(x:0,y:0,width:20,height:20)
btn.setImage(이미지, for: .normal)
btn.addTarget(self,action: #selector(showRedefinedValue), for: .touchUpInside)

inputField.leftView = btn
inputField.leftViewMode = .always
```
