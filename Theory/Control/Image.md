## Image View :

    - Content Mode:
    	1. Scale To Fill : 이미지 무시하고 프레임에 꽉 채운다.
    	2. Aspect Fit :
    	3. Aspect Fill : 이미지 뷰의 프레임을 무시한다. (clip to Bound 하면 프레임 밖 컷 )
    	4.
    - 기본적으로 2개의 이미지를 사용할 수 있다. (이미지, 하이라이티드 -> 조건에 따라 이미지 토글하는거에 사용 good(이미지 자체를 바꾸는거 보다 하이라이티드이미지로 구성하는거 더 심플))
    - 이미지에 따라 크기 자동? ---> 이미지 뷰 사이즈 적절하게 조절하고 content mode  설정 방식이 더 좋음
    - 애니메이션 가능 : 여러개 이미지 애니메이션 만들수 있다. (스토리 보드 안되고 코드를 통해서만 가능) placeholder 있어야 좋아.

```swift
	// 4개의 이미지를 배열에 넣는다.
	let images = (0...3)compactMap { UIImage(named: "phone-ring\($0)")}
	imageView.animationImages = images
	// startAnimation 메소드 만들고 imageView.StartAnimating() 실행
	// stopAnimation 메소드 만들고 if imageView.isAnimating{ imageView.StopAnimating() }
	imageView.animationDuration = 0.1 (기본값) // 1 로 설정 4장의 이미지가 0.25초 마다
	imageView.animationRepeatCount = 5 // 0 기본값 무한정반복
```

## Image 사용 기본

이미지를 추가하면 기본적으로 1로 가는데 드래그해서 옮겨준다.
<br>
바로 옮기려면 파일이름 같게하고 @2x , @3x 를 붙여준다.

- 1x : Non-Retina Display (잘 안쓴다.)
- 2x : Retina Display
- 3x : Retina HD Display

pdf vector 이미지는 크기를 키워도 해상도 깨지지 않는다.
