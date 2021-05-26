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
  
  static var registrant: AllApplesTableViewRegistrant!
  static var sectionedDataSource: SectionedDataSourceClass!
  static var itemDelegate: AllApplesTableViewItemDelegate!
  
  static var sut: AllApplesTableViewDelegate!
  
  
  override class func setUp() {
    registrant = AllApplesTableViewRegistrant(tableCellHandler: TableViewCellProtocolClass())
    sectionedDataSource = SectionedDataSourceClass()
    itemDelegate = TableViewItemDelegateClass()
    sut = AllApplesTableViewDelegate(itemDelegateImplementation: itemDelegate,
                                     sectionHandlerImplementation: sectionedDataSource,
                                     registrant: registrant)
  }
  
  func makeAndPrepareTableView() -> ATableView {
    let tableView = ATableView(frame: CGRect(x: 0, y: 0, width: 100.0, height: 100.0))
    tableView.delegate = AllApplesTableViewItemDelegateTests.sut
//    tableView.dataSource =
//    AllApplesTableViewItemDelegateTests.sut.registrant?.registerReusableViews(with: tableView)
    tableView.reloadData()
    return tableView
  }
  
  
  
}
