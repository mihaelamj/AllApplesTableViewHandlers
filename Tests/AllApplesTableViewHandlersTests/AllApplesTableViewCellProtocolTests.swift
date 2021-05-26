//
//  File.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 26.05.2021..
//

import XCTest
import AllApples
@testable import AllApplesTableViewHandlers

final class AllApplesTableViewCellProtocolTests: XCTestCase {
  
  static var sut: TableViewCellProtocolClass!
  
  override class func setUp() {
    sut = TableViewCellProtocolClass()
  }
  
  func testCellIdentifierForIndexPath() {
    let indexPath = IndexPath(item: 0, section: 0)
    let identifier = AllApplesTableViewCellProtocolTests.sut.tableCellIdentifierFor(indexPath: indexPath)
    
    #if os(iOS) || os(tvOS)
    XCTAssertEqual(identifier, "CellID_iOS")
    #endif
    #if os(OSX)
    XCTAssertEqual(identifier, "CellID1_macOS")
    #endif
  }
  
  func testTableCellClassForIdentifier() {
    let identifier = AllApplesTableViewCellProtocolTests.sut.cellidentifiers.first
    XCTAssertNotNil(identifier)
    
    let cellClass = AllApplesTableViewCellProtocolTests.sut.tableCellClassFor(identifier: identifier!)
    XCTAssertNotNil(cellClass)
    
    let cellClassString = String(describing: cellClass!)
    
    #if os(iOS) || os(tvOS)
    XCTAssertEqual(cellClassString, "UITableViewCell")
    #endif
    #if os(OSX)
    XCTAssertEqual(cellClassString, "AView")
    #endif
  }
  
  func testTableCellIdentifiers() {
    #if os(iOS) || os(tvOS)
    XCTAssertEqual(AllApplesTableViewCellProtocolTests.sut.cellidentifiers, ["CellID_iOS"])
    #endif
    #if os(OSX)
    XCTAssertEqual(AllApplesTableViewCellProtocolTests.sut.cellidentifiers, ["CellID1_macOS", "CellID2_macOS"])
    #endif
  }
  
}
