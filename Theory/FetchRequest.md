## Fetch : Core data 의 데이터를 읽어오는 것

## Fetch Request : 읽어올 데이터의 종류와 필터링 조건, 정렬방식 등을 지정하는 객체

### fetch request 를 생성하는거 4가지 방법

1. NSFetchRequest 인스턴스를 생성하고 엔티티를 속성으로 지정하는 방법

```swift

@IBAction func fetch(_ sender: Any?){
	let context = DataManager.shared.mainContext

	let request = NSFetchRequest<NSMangedObject>()
	let entity = NSEntityDescription.entity(forEntityName: "Employee", in: context)
	request.entity = entity
}
// entity 인스턴스를 직접 만들어야 해서 잘 사용하지 않는다.
```

2. entity 인스턴스를 만들지 않고 생성자로 entity 이름을 전달한다.

```swift
@IBAction func fetch(_ sender: Any?){
	let context = DataManager.shared.mainContext

	let request = NSFetchRequest<NSManagedObject>(entityName: "Employee")

}
// 1번보다 코드가 단순하지만 엔티티 이름에서 오타가 발생하지 않도록 주의 해야한다.
```

3. 엔티티 클래스가 제공하는 타입메소드를 사용하는것

```swift
@IBAction func fetch(_ sender: Any?){
	let context = DataManager.shared.mainContext

	let request: NSFetchRequest<EmployeeEntity> = EmployeeEntity.fetchRequest()

}
// 2번에 비해 잘못될 엔티티 이름을 전달할 확률은 줄었지만 형식 추론을 사용할수없다. 이경우에는 리턴형을 명확히 지정해야한다.: NSFetchRequest<EmployeeEntity>
```

4. Stored Fetch Request 를 사용하는 방법 - 추후 다시..

```swift
@IBAction func fetch(_ sender: Any?){
	let context = DataManager.shared.mainContext



}
//
```

## 실행

- request.execut() 를 통해서 요청을 직접실행할 수 있지만 보통 context로 전달한다.
- context.fetch() 이 메소드는 fetchrequest로 요청한 데이더를 배열로 리턴한다.

```swift
	do{
		list = try context.fetch(request)
		tableView.reloadData()
	} catch {
		fatalError(error.localozedDescription)
	}

```

내용은 계속 추가될 예정
