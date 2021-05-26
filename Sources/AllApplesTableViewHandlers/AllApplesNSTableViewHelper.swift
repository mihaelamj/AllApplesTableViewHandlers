//
//  AllApplesNSTableViewHelper.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 26.05.2021..
//

#if os(OSX)
import Foundation
import AllApples
import Cocoa

public class AllApplesNSTableViewHelper {
  public func makeTextField(_ table: NSTableView) -> NSTextField {
    let tf = NSTextField(frame: NSRect(x: 0, y: 0, width: table.frame.size.width, height: 0))
    return tf
  }
  
  public func fetchIndexOfColumnIn(_ tableView: NSTableView, tableColumn: NSTableColumn?) -> Int? {
    let index = tableView.tableColumns.firstIndex(where: { $0 == tableColumn })
    return index
  }
}
#endif
