//
//  DynamicIslandModule.swift
//  RNDynamicIslandDemo
//
//  Created by Hoa Phan on 26/09/2022.
//

@objc(DynamicIslandModule)
class DynamicIslandModule: NSObject {

  @objc(testFunc:withMessage:withResolver:withRejecter:)
  func testFunc(title: NSString, message: NSString, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    resolve("\(title) \(message)")
  }
}
