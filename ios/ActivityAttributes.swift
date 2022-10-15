//
//  ActivityAttributes.swift
//  RNDynamicIslandDemo
//
//  Created by Hoa Phan on 28/09/2022.
//

import Foundation
import ActivityKit

// Notification
struct NotificationAttributes: ActivityAttributes {
  public typealias NotificationStatus = ContentState
  
  public struct ContentState: Codable, Hashable {
    var mesage: String
  }
  
  var title: String
}

// FoodOrder
struct FoodOrderAttributes: ActivityAttributes {
  public typealias FoodOrderStatus = ContentState
  
  public struct ContentState: Codable, Hashable {
    var mesage: String
  }
  
  var title: String
  var image: String
}
