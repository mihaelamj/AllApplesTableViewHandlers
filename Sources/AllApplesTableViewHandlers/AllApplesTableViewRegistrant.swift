//
//  AllApplesTableViewRegistrant.swift
//  AllApplesTableViewHandlers
//
//  Created by Mihaela Mihaljevic Jakic on 26.05.2021..
//

import Foundation
import AllApples

#if os(iOS) || os(tvOS)
import UIKit
#endif

#if os(OSX)
import Cocoa
#endif

// MARK: -
// MARK: AllApplesTableViewRegistrant -

public class AllApplesTableViewRegistrant {
  
  // MARK: Properties -
  
  var tableCellHandler: AllApplesTableViewCellProtocol
  
  // MARK: Init -
  
  public init(tableCellHandler: AllApplesTableViewCellProtocol) {
    self.tableCellHandler = tableCellHandler
  }
}

// MARK: -
// MARK: AllApplesTableViewRegistrant Helper Methods -

public extension AllApplesTableViewRegistrant {
  func registerReusableViews(with tableView: ATableView) {
    #if os(iOS) || os(tvOS)
    tableCellHandler.tableCellIdentifiers.forEach { cellIdent in
      let cellClass = tableCellHandler.tableCellClassFor(identifier: cellIdent)
      tableView.register(cellClass, forCellReuseIdentifier: cellIdent)
    }
    #endif
    
    #if os(OSX)
    tableCellHandler.tableCellIdentifiers.forEach { cellIdent in
      let ident = NSUserInterfaceItemIdentifier(rawValue: cellIdent)
      tableView.addTableColumn(NSTableColumn(identifier: ident))
    }
    #endif
  }
  
  #if os(OSX)
  func identifierFor(column: Int) -> String? {
    let indexPath = IndexPath(item: 0, section: column)
    return tableCellHandler.tableCellIdentifierFor(indexPath: indexPath)
  }
  #endif
}
