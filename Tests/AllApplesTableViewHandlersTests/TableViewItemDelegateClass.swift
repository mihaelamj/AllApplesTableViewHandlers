//
//  TableViewItemDelegateClass.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 26.05.2021..
//

import AllApples
@testable import AllApplesTableViewHandlers

// MARK: -
// MARK: Class for TableViewItemDelegate -

class TableViewItemDelegateClass {
  var tapCounter = 0
}

extension TableViewItemDelegateClass: AllApplesTableViewItemDelegate {
  func didTapOn(dataSource: Any, item: Any) {
    tapCounter += 1
  }
  
}
