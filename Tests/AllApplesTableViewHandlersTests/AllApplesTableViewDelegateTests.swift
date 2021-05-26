//
//  AllApplesTableViewDelegateTests.swift
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

final class AllApplesTableViewDelegateTests: XCTestCase {
  
  static var registrant: AllApplesTableViewRegistrant!
  static var sectionedDataSource: SectionedDataSourceClass!
  static var itemDelegate: AllApplesTableViewItemDelegate!
  static var tableViewDataSource: AllApplesTableViewDataSource!
  
  static var sut: AllApplesTableViewDelegate!
  
  
  override class func setUp() {
    registrant = AllApplesTableViewRegistrant(tableCellHandler: TableViewCellProtocolClass())
    sectionedDataSource = SectionedDataSourceClass()
    itemDelegate = TableViewItemDelegateClass()
    sut = AllApplesTableViewDelegate(itemDelegateImplementation: itemDelegate,
                                     sectionHandlerImplementation: sectionedDataSource,
                                     registrant: registrant)
    
    tableViewDataSource = AllApplesTableViewDataSource(sectionHandlerImplementation: sectionedDataSource,
                                                     registrant: registrant)
  }
  
  func makeAndPrepareTableView() -> ATableView {
    let tableView = ATableView(frame: CGRect(x: 0, y: 0, width: 100.0, height: 100.0))
    tableView.delegate = AllApplesTableViewDelegateTests.sut
    tableView.dataSource = AllApplesTableViewDelegateTests.tableViewDataSource
    AllApplesTableViewDelegateTests.sut.registrant?.registerReusableViews(with: tableView)
    tableView.reloadData()
    return tableView
  }
  
  #if os(iOS) || os(tvOS)
  func testDidSelectRow() {
    let tableView = makeAndPrepareTableView()
    
    let itemDelegate = AllApplesTableViewDelegateTests.sut.itemDelegate as? TableViewItemDelegateClass
    XCTAssertNotNil(itemDelegate)
    
    let indexPath = IndexPath(item: 0, section: 0)
    
    tableView.delegate?.tableView?(tableView, didSelectRowAt: indexPath)
    XCTAssertEqual(itemDelegate!.tapCounter, 1)
    
    tableView.delegate?.tableView?(tableView, didSelectRowAt: indexPath)
    XCTAssertEqual(itemDelegate!.tapCounter, 2)
    
    tableView.delegate?.tableView?(tableView, didSelectRowAt: indexPath)
    XCTAssertEqual(itemDelegate!.tapCounter, 3)
  }
  #endif
  
  #if os(OSX)
  func testViewForTableColumn() {
    let tableView = makeAndPrepareTableView()
    
    let tableColumn = tableView.tableColumns[0]
    let cell = tableView.delegate?.tableView?(tableView, viewFor: tableColumn, row: 0)
    XCTAssertNotNil(cell)
    
    let cellType = type(of: cell!)
    let cellClassString = String(describing: cellType)
    XCTAssertEqual(cellClassString, "NSTextField")
  }
  #endif
  
}
