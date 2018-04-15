//
//  mastodonTimeLineTests.swift
//  mastodonTimeLineTests
//
//  Created by Екатерина Волкова on 13/04/2018.
//  Copyright © 2018 VolkovaKatie. All rights reserved.
//

import XCTest
@testable import mastodonTimeLine

class mastodonTimeLineTests: XCTestCase {
    
    class MockAPI: APIProtocol {
        func timeline(completion: @escaping (Result<[Status]>) -> Void) {
            let account = Account(id: "123", username: "name", displayName: "name", avatarURL: "")
            let st = Status(id: "123",
                            createdAt: "2018-04-15T07:20:51.311Z",
                            content: "<p>text</p>",
                            account: account,
                            attachments: [])
            
            completion(.success([st]))
        }
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTimelineViewModel() {
        let vm = TimeLineViewModel(api: MockAPI())
        vm.requestTimeLine()
        
        XCTAssertTrue(vm.numberOfTableViewRows == 1)
        let indexPath = IndexPath(row: 0, section: 0)
        let cellVM = vm.getCellViewModel(at: indexPath)
        XCTAssertTrue(cellVM.contentText.string == "text\n")
        XCTAssertTrue(cellVM.usernameText == "name")
    }
    
}
