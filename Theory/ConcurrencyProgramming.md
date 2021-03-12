이 내용은 다시 공부하고 정리할 것

## Concurrency Programming

: 여러개의 작업이 동시에 실행되도록 프로그래밍 하는 것
<br>
: 모바일에서는 작업을 빠르게 실행하는것도 중요하지만 타이밍을 조절해서 반응성을 높이는 것도 중요하다.

### CoCoaTouch 는 Concurrency Programming 에 사용하는 Operation 과 GCD 를 제공한다.

: 두가지를 활용하면 하드웨를 최대한 활용하여 빠르고 반응성이 높은 앱을 개발할 수 있다.

## Main Thread ---> Main Queue

- UI Tasks
- User Event Tasks

## Background Thread ---> Global Queue , Background Queue

- Network Tasks
- File Tasks
- Othere Long-running Tasks

### ios 앱을 개발할때는 쓰레드를 직접 다루지 않는다. -> Operation & GCD 를 사용해서 알아서 구현

## Queue : 쓰레드에서 실행할 작업을 저장할 요소

- Operation : 작업사이의 의존성을 부여하거나 취소기능을 부여할때 사용
- GCD(Grand Central Dispatch) : 나머지 경우에 사용

```swift
class StartViewController: UIViewController {

	@IBOutlet weak var countLabel: UILabel!

	// Action 메소드는 항상 메인쓰레드에서 실행된다. 다른 메소드도 별도로 지정하지 않으면 메인에서 실행
	@IBAtion func start(_ sender: Any){
		countLabel.text = "0"

		for count in 0...100 {
			countLabel.text = "\(count)"
			Thread.sleep(forTimeInterval: 0.1) // 쓰레드를 잠시 중지하는
		}
	}

	func logThread(with task: String) {
		if Thread.isMainThread {
			pring("Main Thread: \(task)")
		} else {
			print("Background Thread: \(task)")
		}
	}

	override func viewDidLoad(){
		super.viewDidLoad()
	}
}
// 그러나 결과는 0.1마다 레이블이 업데이트 되지 않고 10초동안 아무버튼 못누르고 있다가 100으로 변경된다. 메인쓰레드를 점유하고 있어서 다른 이벤트는 무시. -> 메인 쓰레드가 블록킹 되었다.
//
```

```swift
class StartViewController: UIViewController {

	@IBOutlet weak var countLabel: UILabel!

	// Action 메소드는 항상 메인쓰레드에서 실행된다. 다른 메소드도 별도로 지정하지 않으면 메인에서 실행
	@IBAtion func start(_ sender: Any){
		countLabel.text = "0"

		// 백그라운드에서 실행되도록 변경
		DispatchQueue.global().async {
			for count in 0...100 {
				self.countLabel.text = "\(count)"
				Thread.sleep(forTimeInterval: 0.1)
			}
		}

	}

	func logThread(with task: String) {
		if Thread.isMainThread {
			pring("Main Thread: \(task)")
		} else {
			print("Background Thread: \(task)")
		}
	}

	override func viewDidLoad(){
		super.viewDidLoad()
	}
}
// 그러나 결과는 안된다. 왜? UILabel은 메인에서 해줘야하니까.
```

```swift
class StartViewController: UIViewController {

	@IBOutlet weak var countLabel: UILabel!

	// Action 메소드는 항상 메인쓰레드에서 실행된다. 다른 메소드도 별도로 지정하지 않으면 메인에서 실행
	@IBAtion func start(_ sender: Any){
		countLabel.text = "0"

		DispatchQueue.global().async {
			for count in 0...100 {
				// 이 블록은 메인 쓰레드에서 실행됨 ( 백그라운드에서 코드를 실행한다음 UI를 업데이트 할때 자주 사용)
				DispatchQueue.main.async {
					self.countLabel.text = "\(count)"
				}
				Thread.sleep(forTimeInterval: 0.1)
			}
		}

	}

	func logThread(with task: String) {
		if Thread.isMainThread {
			pring("Main Thread: \(task)")
		} else {
			print("Background Thread: \(task)")
		}
	}

	override func viewDidLoad(){
		super.viewDidLoad()
	}
}
// 결과는 0.1초마다 레이블이 업데이트 되고 다른 컨트롤도 지연없이 처리한다.
```

### 쓰레드를 확인하는 api

```swift
func logThread(with task: String){
	if Thread.isMainThread {
		print("Main Thread: \(task)") // 메소드의 코드가 메인쓰레드에서 실행되면 true
	} else {
		print("Background Thread: \(task)")
	}
}
```
