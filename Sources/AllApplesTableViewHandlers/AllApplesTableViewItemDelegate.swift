//
//  TableViewItemDelegate.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 26.05.2021..
//

import Foundation

public protocol TableViewItemDelegate: AnyObject {
  func didTapOn(dataSource: AllApplesTableViewCellProtocol, item: Any)
}
