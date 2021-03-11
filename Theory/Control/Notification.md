# Local Notification

## Notification 실행순서

IOS 는 User Notification Center 를 통해 로컬 노티피케이션을 관리한다.

1. 엡에서 노티피케이션을 예약하면 해당 시점의 노티피케이션을 전달한다(유저노티피케이션에)
2. 앱이 실행중인 상태라면 직접 전달하고 , 실행중이 아니라면 배너를 통해 전달한다.

## Notification 구현

1. 로컬 노티피케이션 권한을 요청
2. 노티피케이션 객체를 생성하고 , 필요한 정보를 담아서 노티피케이션 센터에 예약을 요청한다.
3. 노티피케이션이 전달 되었을때 실행할 코드를 구현한다.

- 로컬 노티피케이션은 실행 상태에 따라서 처리방식이 달라진다.
  - 앱이 포그라운드에서 실행중일때 : delegate 메소드가 호출
  - 앱이 백그라운드에서 실행중일때, 실행중이지 않을때 : IOS가 직접 노티피케이션을 호출한다.
  - 사용자가 배너를 터치하거나 액션을 선택하면 연관된 delegate 메소드가 호출된다.

## UNUserNotificationCenter

: 로컬 노티피케이션과 관련되 기능은 이 클래스가 제공하는 메소드를 통해 제공된다.
: 이 클래스에 인스턴스를 직접 생성하는것은 불가능하고 항상 UNUserNotificationCenter.current()가 리턴하는 인스턴스를 사용한다.

## UNUserNotificationCenterDelegate

앱으로 전달될 로컬 노티피케이션 이 프로토콜을 통해 처리한다.

1. 권한 요청 : AppDelegate 에서

```swift

import UserNotifications


UNUserNotificationCenter.current().requestAuthorization(options: [UNAuthorizationOprions.badge, .sound, .alert]), completionHandler: {(granted, error) in
if granted {
	UNUserNotificationCenter.current().delegate = self
}
print("granted\(granted)")
}
// UNAuthorizationOprions. badge 는 앱아이콘에 숫자 표시 . sound 는 알림사운드 재생 , alert 는 배너를 통해


extension AppDelegate: UNUserNotificationCenterDelegate {

}


```

## 트리거

1. UNCalendarNotificationTrigger : 노티피케이션에 전달되는 날짜와 시간을 직접 지정할때 사용 (매일 아침 지정된 시간, 특정 날짜에)
2. UNTimeIntervalNotificationTrigger : 현재 시점을 기준으로 지정할때 사용 (한시간뒤.,..)
3. UNLocationNotificationTrigger : 특정 지역에서 전달할 때 사용

# Remote Notification (apple developer 가입해야해) - 나중에 할 예정

: 대부분의 내용이 Local 과 비슷 ( 사용자 입장에서는 로컬과원격 차이 없음)

리모트 노티를 실제로 전달하는 서버 : APNs (애플이 관리하는 서버)
APNs로 노티요청을 전달하는 서버 : Provider(직접구현해야함(서버구현, 클라우드 서비스 이용))

- Configuring Remote Notification Support
- Registering to Receive Remote Notifications
- Obtaining a Device Token
