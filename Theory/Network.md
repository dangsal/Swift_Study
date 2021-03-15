## 애플은 네트워크 개발에 대한 몇가지 가이드라인을 제시한다.
  1.  Use High-Leverl APIs 
  2.  Transfer only as much data as required
  3.  Use Caches
  4.  Use Asynchronous APIs
  5.  Use Hostnames
  6.  Use HTTPS 

## 네트워크 개발에 사용하는 API
1. URLSession 
	- API Request
	- File Transfer
	- Authentication
2. WebKit
	- Display web content
	- Browser Features
	- Script Injection
3. GameKit
	- Bluetooth, Wi-Fi LAN Connection
	- Game Center Integration
	- Voice Chat 
4. MultipeerConnectivity
	- Wi-Fi
	- Peer-to-Peer Wi-Fi
	- Bluetooth Personal Area Network
5. Bonjour
	- Automatic discovery of devices and services on a local network
6. CFNetwork
	- Access network services
	- Handle changes in network configurations
7. Network
	- Direct access to TLS, TCP, and UDP 


## 네트워크는 항상 백그라운드에서 진행되어야해.


## JSON 

### data -> JSON

#### JSON 으로 인코딩 되는 형식은 엔코더블 프로토콜을 채용해야한다. 반대도 , 둘다는 Codable

```swift
struct Person: Codable {
	var firstName: String
	var lastName: String
	var birthDate: Date
	var address: String?
}

let p = Person(firstName:"SUNGHO",lastName:"LEE",birthDate: Date(timeIntervalSince1970:1234567),address:"Seoul")

// 인스턴스에 저장된 데이터를 JSON으로 바꿀때는 JSON 인코더를 사용한다.

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted // 줄바꿈
encoder.outputFormatting = .sortedKeys // 정렬

encoder.dateEncodingStrategy = .iso8601 // date 표준문자열

let formatter = DateFormatter()
formatter.dateFormat = "yyyy/MM/dd"

encoder.dateEncodingStrategy = .formattered(formatter)// date 커스텀 포맷

do {
	let jsonData = try encoder.encode(p) // 보통 서버로 전달할때는 바이너리 정보를 그대로 전달한다.

	if let jsonStr = String(data: jsonData, encoding: .utf8){
		print(jsonStr)
	}
} catch{
	print(error)
}
```

### JSON -> data

```swift
struct Person: Codable {
	var firstName: String
	var lastName: String
	var birthDate: Date
	var address: String?
}

let jsonStr = """
{
	"fristName" : "SUNGHO",
	"age" : 26 , 
	"lastName" : LEE ,
	"address" : "Seoul"
}
"""

guard let jsonData = jsonStr.data(using: .utf8) else {
	fatalError()
}

let decoder = JSONDecoder()

do {
	let p = try decoder.decode(Person.self, from: jsonData)
	dump(p)
} catch {
	print(error)
}



```






내용은 계속 추가 될 예정.