//
//  MVVMSwiftUIAppTests.swift
//  MVVMSwiftUIAppTests
//
//  Created by Kaiserdem on 14.06.2021.
//

import XCTest
@testable import MVVMSwiftUIApp

class MockDataService: DataService {
    func getUser(completion:@escaping ([User]) -> Void) {
        completion([User(name: "Test", id: 1)])
    }
}

class MVVMSwiftUIAppTests: XCTestCase {
    
    var sot: UsersView.ViewModel!

    override func setUpWithError() throws {
        //sot = .init()
        sot = UsersView.ViewModel(dataService: MockDataService())
    }

    override func tearDownWithError() throws {
        sot = nil
    }

    func test_getUsers() throws {
        XCTAssertTrue(sot.users.isEmpty)
        
        sot.getData()
        XCTAssertEqual(sot.users.count, 1)
    }

   

}
