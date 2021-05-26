//
//  File.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 26.05.2021..
//

#if os(OSX)
import Foundation
import Cocoa
import XCTest
import AllApples
@testable import AllApplesTableViewHandlers

final class AllApplesNSTableViewHelperTests: XCTestCase {
  
  static var sut: AllApplesNSTableViewHelper!
  
  override class func setUp() {
    sut = AllApplesNSTableViewHelper()
  }
  
  func testMakeTextField() {
    let side: CGFloat = 100.0
    let tableView = NSTableView(frame: CGRect(x: 0, y: 0, width: side, height: side))
    XCTAssertNotNil(tableView)
    let textField = AllApplesNSTableViewHelperTests.sut.makeTextField(tableView)
    XCTAssertNotNil(textField)
    XCTAssertEqual(textField.bounds.size.width, side)
    XCTAssertEqual(textField.bounds.size.height, 0.0)
  }
  
  func testFetchIndexOfColumnIn() {
    let side: CGFloat = 100.0
    let tableView = NSTableView(frame: CGRect(x: 0, y: 0, width: side, height: side))
    XCTAssertNotNil(tableView)
    
    let registrant = AllApplesTableViewRegistrant(tableCellHandler: TableViewCellProtocolClass())
    registrant.registerReusableViews(with: tableView)
    
    // ["CellID1_macOS", "CellID2_macOS"]
    let ident = NSUserInterfaceItemIdentifier(rawValue: "CellID1_macOS")
    let tableColumnIndex = tableView.column(withIdentifier: ident)
    XCTAssertEqual(tableColumnIndex, 0)
    
    let tableColumn = tableView.tableColumns[tableColumnIndex]
    XCTAssertNotNil(tableColumn)
    
    let indexOfColumn = AllApplesNSTableViewHelperTests.sut.fetchIndexOfColumnIn(tableView, tableColumn: tableColumn)
    XCTAssertEqual(indexOfColumn, 0)
  }
  
}

#endif
