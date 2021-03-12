## CollectionView 에서 Cell 위치를 변경하는 방법

- 컬렉션 뷰는 별도의 편집 모드를 제공하지않는다. 그래서 테이블뷰와같이 reordering 컨트롤이 제공되지 않는다.
- 컬렉션 뷰에서는 Pan Gesture 를 통해서 구현한다. (셀을 이동시키는 기능과 애니메이션 기능은 이미 구현되어있다.)

- 하지만 이동시킬 셀과 팬제스쳐를 추적하는 코드는 직접 구현해야한다.
- CollectionView 에서 reordering 부분은 2가지로 구분
  1.  먼저 delegate 메소드를 구현하고 리오더링 기능을 활성화 시켜야 한다.
  2.  팬제스쳐 레코그니션을 컬렉션뷰와 연결하고 제스쳐 상태가 업데이트 되면 컬렉션뷰가 인식할수있도록 구현해야한다.

1. Pan Gesture Recognition 을 씬 독에 추가한다.
2. 컬렉션 뷰를 선택하고 Pan Gesture Recognition 와 연결한다. (컨트롤 드래그 앤 드롭)
3. 씬독에 있는 Pan Gesture 를 선택하고 컨트롤 드래그로 액션 만든다. (이름:: handlePanGesture , 타입: UIPanGestureRecognizer)
4. 액션에서는 제스쳐 상태에 따라서 특정 api 호출하는 방법으로 구현

```swift
@IBAction func (_ sender: UIPanGestureRecognizer) { // 제스처를 추적하는 코드
	let location = sender.location(in: listCollectionView) //  제스쳐가 발생된 위치를 상수에 저장

	// 제스쳐 상태를 스위치 문으로 나눈다.
	switch sender.state {
		case .began:
			if let indexPath = listCollectionView.indexPathForItem(at: location){
				listCollectionView.beginInteractiveMovementForItem(at: indexPath)
			}
		case .changed:
			listCollectionView.updateInteractiveMovementTargetPosition(location)
		case .ended:
			listCollectionView.endInteractiveMovement()
		default:
			listCollectionView.cancelInteractiveMovement()

	}
}
```

5. delegate 메소드구현, 리오더링기능 활성화 ( 데이터 소스 익스텐션에 메소드 추가)

```swift
	extension ReorderingViewController: UICollectionViewDataSource {
		// 이 메소드가 구현되어 있어야 리오더링이 실제로 구현됨
		func collectionView(_ collectionView: UICollectionView, moveItenAtsourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
		{
			// 바뀐위치에 따라서 내용을 업데이트하는 코드
			list target = list[sourceIndexPath.section].colors.remove(at: sourceIndexPath.item)
			list[destinationIndexPath.section].colors.insert(target, at: destinationIndexPath.item)

		}
		// 아래 메소드는 셀을 이동시키기 전에 호출된다.
		func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
			return true // 실제로 이동 false - 금지
		}
	}
```
