//
//  ActivityAttributes.swift
//  RNDynamicIslandDemo
//
//  Created by Hoa Phan on 28/09/2022.
//

import Foundation
import ActivityKit

struct NotificationAttributes: ActivityAttributes {
  public typealias NotificationStatus = ContentState
  
  public struct ContentState: Codable, Hashable {
    var mesage: String
  }
  
  var title: String
}

