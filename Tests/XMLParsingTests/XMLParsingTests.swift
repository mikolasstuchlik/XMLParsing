import XCTest
@testable import XMLParsing

class XMLParsingTests: XCTestCase {

    struct SomeData: Codable {
        let myArray: [Int]
        let myBool: Bool
        let myNames: [String]
        let nested: SomeData2?
    }

    struct SomeData2: Codable {
        let myArray: [Int]
        let myBool: Bool
        let myNames: [String]
        let nested: SomeData3?
    }

    struct SomeData3: Codable {
        let myArray: [Int]
        let myBool: Bool
        let myNames: [String]
    }

    let dummyData: SomeData = SomeData(myArray: [15,1,198,-156,-4], myBool: true, myNames: ["Hi","Miki","Whatever"], nested: SomeData2(myArray: [-156,-4], myBool: true, myNames: ["Hi","adsf","fddf"], nested: SomeData3(myArray: [15,1,198], myBool: true, myNames: ["asas","Miki","Whatever"])))

    func testEncodePretty() {
        let xmlEncoder = XMLEncoder()
        xmlEncoder.outputFormatting.update(with: .prettyPrinted)
        xmlEncoder.outputFormatting.update(with: .sortedKeys)

        let encoded = try! xmlEncoder.encode(dummyData, withRootKey: "xml-dummy")
        let string = String(data: encoded, encoding: .utf8)!

        print(string)
    }

    func testEncodeNonPretty() {
        let xmlEncoder = XMLEncoder()

        let encoded = try! xmlEncoder.encode(dummyData, withRootKey: "xml-dummy")
        let string = String(data: encoded, encoding: .utf8)!

        print(string)
    }

}
