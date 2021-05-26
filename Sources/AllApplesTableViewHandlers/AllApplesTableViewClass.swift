//
//  File.swift
//  
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

open class AllApplesTableViewHandlerClass: NSObject {
  #if os(iOS) || os(tvOS)
  var defaultTextColor = AColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1) // #424242
  #endif
  
  #if os(OSX)
  var defaultTextColor = AColor.white
  #endif
}
