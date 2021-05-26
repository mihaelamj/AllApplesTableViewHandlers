//
//  TableViewRegistrantTests.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 26.05.2021..
//

import XCTest
import AllApples
@testable import AllApplesTableViewHandlers

final class TableViewRegistrantTests: XCTestCase {
  
  static var sut: AllApplesTableViewRegistrant!
  
  override class func setUp() {
    sut = AllApplesTableViewRegistrant(tableCellHandler: AllApplesTableViewCellProtocolTests.sut)
  }
  
  
}
