//
//  TableViewRegistrantTests.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 26.05.2021..
//

import XCTest
import AllApples
@testable import AllApplesTableViewHandlers

final class AllApplesTableViewRegistrantTests: XCTestCase {
  
  static var sut: AllApplesTableViewRegistrant!
  
  override class func setUp() {
    sut = AllApplesTableViewRegistrant(tableCellHandler: TableViewCellProtocolClass())
  }
  
  func testTableViewRegistrant() {
    let identifiers = AllApplesTableViewRegistrantTests.sut.tableCellHandler.tableCellIdentifiers
    #if os(iOS) || os(tvOS)
    XCTAssertEqual(identifiers, ["CellID_iOS"])
    #endif
    #if os(OSX)
    XCTAssertEqual(identifiers, ["CellID1_macOS", "CellID2_macOS"])
    #endif
  }
  
  #if os(OSX)
  func testTableViewRegistrantIdentifierForColumn() {
    let column1 = AllApplesTableViewRegistrantTests.sut.identifierFor(column: 0)
    XCTAssertEqual(column1, "CellID1_macOS")
    
    let column2 = AllApplesTableViewRegistrantTests.sut.identifierFor(column: 1)
    XCTAssertEqual(column2, "CellID2_macOS")
  }
  #endif
}
