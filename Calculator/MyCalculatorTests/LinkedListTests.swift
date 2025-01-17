//
//  MyCalculatorTests.swift
//  MyCalculatorTests
//
//  Created by yeton on 2022/05/17.
//

import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Double>?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Double>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_노드가_없을때_isEmpty가_True이다() {
        // give
        sut?.self.head = nil
        
        // when
        let result = sut?.isEmpty()
        
        // then
        XCTAssertTrue(result!)
    }
    
    func test_linkedList에서_여러data를append를했을때_append한값의head가_일치한다() {
        // give
        sut?.append(data: 3)
        sut?.append(data: 13)
        sut?.append(data: 24)
        
        // when
        let headData = sut?.self.head?.data
        
        // then
        XCTAssertEqual(headData, 3)
    }
    
    func test_linkedList에서_여러data를append를했을때_removeFirst를하면_첫번째로넣은값이반환된다() {
        // give
        sut?.append(data: 3)
        sut?.append(data: 13)
        sut?.append(data: 24)
        
        // when
        let result = sut?.removeFirst()
        
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_removeAll했을때_head가nil이된다() {
        // give
        sut?.append(data: 3)
        sut?.append(data: 13)
        
        // when
        sut?.removeAll()
        
        // then
        XCTAssertEqual(sut?.self.head?.data, nil)
    }
}
