//
//  AllApplesTableViewItemDelegateTests.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 26.05.2021..
//

import XCTest
import AllApples
@testable import AllApplesTableViewHandlers

#if os(iOS) || os(tvOS)
import UIKit
#endif

#if os(OSX)
import Cocoa
#endif

final class AllApplesTableViewItemDelegateTests: XCTestCase {
  
  func testDidTapOnCounter() {
    let itemDelegate = TableViewItemDelegateClass()
    XCTAssertEqual(itemDelegate.tapCounter, 0)
    
    itemDelegate.didTapOn(dataSource: "Data Source", item: "Item")
    XCTAssertEqual(itemDelegate.tapCounter, 1)
    
    itemDelegate.didTapOn(dataSource: "Data Source", item: "Item")
    XCTAssertEqual(itemDelegate.tapCounter, 2)
  }
}
