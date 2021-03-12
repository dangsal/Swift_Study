## Core Data : 데이터를 영구적으로 저장할 때 사용하는 방식(앱을 종료해도 데이터가 사라지지 않는 방식)

### 코어 데이터는 4개지 중요한 객체로 구성되어있다.

### Core Data Stack

    1. Persistent Store (NSPersistentStore) : 영구 저장소  :
    - 메모리에 저장되는 데이터와 달리 앱을 종료하거나 전원을 차단해도 유지된다.
    - 기본적으로 4가지 저장소를 제공하며 필요에 따라 직접 제작하는것도 가능하다.
    - 데이터를 메모리에 로딩하는 방식에 따라서 Atomic Store , Non-atomic Store 로 구분한다.
    	- Atomic Store 는 데이터를 처리할 때 모든 데이터를 메모리에 로드해야한다.(XML Store, Binary Store, In-Memory Strore)(데이터가 클수록 성능이 저하. ios 앱개발에서는 잘 사용하지 않는다.), 다만 인메모리 저장소는 캐싱을 구현할 때 사용하기도 한다.
    	- Non-atomic Store 는 필요한 부분만 메모리에 로드한다. 코어데이터는 Non-atomic 저장소인 SQLite 를 기본 저장소로 사용한다.(적은 메모리 사용량 빠른 성능을 제공헤서 ios앱에 가장 적합한 저장소)
    2. Object Model (NSManagedObjectModel) : 어떤 데이터가 저장되고 데이터들이 어떤 관계를 갖고 있는지 설명하는 객체.
    - 영구 저장소에 저장하려면 어떤구조인지 파악해야하는데 필요한 모든 정보가 여기에 저장된다.
    - 코드를 통해 직접 구현할수도 있지만 대부분 xcode가 제공하는 모델 편집기를 사용해서 구현한다.
    3. Persistent Store Coordinator (NSPersistentaStoreCoordinator) : 영구저장소코디네이터
    - 영구저장소에 저장되어있는 데이터를 가져오거나 저장하는 객체이다.
    - 코어데이터가 다양한 영구저장소를 사용할 수 있는것은 영구저장소 코디네이터가 데이터를 준비하기 때문이다.
    - context객체를 통해 데이터를 저장하면 오브젝트모델을 통해 구조를 파악하고 영구저장소에 알아서 저장한다.
    4. Managed Object Context (NSManagedObjectContext) : 코어데이터를 통해 실행하는 작업은 대부분 context가 담당한다.
    - 컨텍스트는 보통 스크레치패드와 비교하여 설명한다.
    - 코어 데이터에서 데이터를 생성하면 바로 영구저장소에 저장되지는 않는다. context 내부에 임시데이터로 유지된다.
    - context에게 저장을 요청해야 영구저장소에 저장된다.
    - 반대로 context를 저장하지 않고 종료하면 저장되지않은 모든 데이터가 사라진다.
    - 영구저장소에서 읽어온 데이터도 context에서 처리된다. 이 데이터는 영구데이터에 저장되어있는 데이터의 복사본이다. 그래서 context에 있는 데이터를 수정해도 원본데이터는 수정되지 않는다. 수정된 내용을 저장하려면 context를 저장해야한다.
    - 보통 하나의 context를 사용하지만 필요에 따라서 여러개의 context를 사용하기도 한다.

- 대부분의 작업은 context 가 제공하는 api를 통해서 구현된다.
- 나머지 3객체는 초기화 시점을 제외하고는 잘 사용되지 않는다.

### Persistent Container (NSPersistentContainer) : 컨테이너는 코어데이터 스택을 캡슐화한 객체이다.
