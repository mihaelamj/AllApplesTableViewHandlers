//
//  File.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 26.05.2021..
//

import Foundation
import AllApples
import CollectionUtil
@testable import AllApplesTableViewHandlers

class TableViewCellProtocolClass {
  #if os(iOS) || os(tvOS)
  let cellidentifiers = ["CellID_iOS"]
  #endif
  #if os(OSX)
  let cellidentifiers = ["CellID1_macOS", "CellID2_macOS"]
  #endif
  
  #if os(iOS) || os(tvOS)
  let cellClasses = [ATableViewCell.self]
  #endif
  #if os(OSX)
  let cellClasses = [AView.self]
  #endif
}

extension TableViewCellProtocolClass: AllApplesTableViewCellProtocol {
  func tableCellIdentifierFor(indexPath: IndexPath) -> String? {
    return cellidentifiers[safe: indexPath.section]
  }
  
  func tableCellClassFor(identifier: String) -> CellClassType? {
    guard let index = cellidentifiers.firstIndex(where: { $0 == identifier }) else { return nil }
    return cellClasses[safe: index]
  }
  
  var tableCellIdentifiers: [String] {
    return cellidentifiers
  }
  
  var tableCellClassTypes: [CellClassType] {
    return cellClasses
  }
  
}
