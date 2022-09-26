//
//  DynamisIslandBridge.m
//  RNDynamicIslandDemo
//
//  Created by Hoa Phan on 26/09/2022.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(DynamicIslandModule, NSObject)

RCT_EXTERN_METHOD(testFunc:(NSString)title withMessage:(NSString)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

@end
