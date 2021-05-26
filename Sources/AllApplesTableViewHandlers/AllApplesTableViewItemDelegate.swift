//
//  AllApplesTableViewItemDelegate.swift
//  AllApplesTableViewHandlers
//
//  Created by Mihaela Mihaljevic Jakic on 26.05.2021..
//

import Foundation

public protocol AllApplesTableViewItemDelegate: AnyObject {
  func didTapOn(dataSource: AllApplesTableViewCellProtocol, item: Any)
}
