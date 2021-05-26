//
//  AllApplesTableViewDataSourceTests.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 26.05.2021..
//

import XCTest
import AllApples
import MMJSectionedDataSource
@testable import AllApplesTableViewHandlers

#if os(iOS) || os(tvOS)
import UIKit
#endif

#if os(OSX)
import Cocoa
#endif

final class AllApplesTableViewDataSourceTests: XCTestCase {
  
  static var registrant: AllApplesTableViewRegistrant!
  static var sectionedDataSource: SectionedDataSourceClass!
  static var sut: AllApplesTableViewDataSource!
  
  override class func setUp() {
    registrant = AllApplesTableViewRegistrant(tableCellHandler: TableViewCellProtocolClass())
    sectionedDataSource = SectionedDataSourceClass()
    sut = AllApplesTableViewDataSource(sectionHandlerImplementation: sectionedDataSource,
                                       registrant: registrant)
  }
  
  func makeAndPrepareTableView() -> ATableView {
    let tableView = ATableView(frame: CGRect(x: 0, y: 0, width: 100.0, height: 100.0))
    tableView.dataSource = AllApplesTableViewDataSourceTests.sut
    AllApplesTableViewDataSourceTests.sut.registrant?.registerReusableViews(with: tableView)
    tableView.reloadData()
    return tableView
  }
  
  #if os(iOS) || os(tvOS)
  func testNumberOfSectionsInTableView() {
    let tableView = makeAndPrepareTableView()
    let sectionCount = tableView.numberOfSections
    XCTAssertEqual(sectionCount, 1)
  }
  
  func testCellForRowAtIndexPath() {
    let tableView = makeAndPrepareTableView()
    let indexPath = IndexPath(item: 0, section: 0)
    let cell = tableView.cellForRow(at: indexPath)
    XCTAssertNotNil(cell)
    let cellType = type(of: cell!)
    let cellClassString = String(describing: cellType)
    XCTAssertEqual(cellClassString, "UITableViewCell")
  }
  #endif
  
  func testNumberOfRowsInTableView() {
    let tableView = makeAndPrepareTableView()
    #if os(OSX)
    let numberOfRows = tableView.numberOfRows
    #endif
    #if os(iOS) || os(tvOS)
    let numberOfRows = tableView.numberOfRows(inSection: 0)
    #endif
    XCTAssertEqual(numberOfRows, 4)
  }
  
}
