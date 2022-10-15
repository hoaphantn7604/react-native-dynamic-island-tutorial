//
//  DynamisIslandBridge.m
//  RNDynamicIslandDemo
//
//  Created by Hoa Phan on 26/09/2022.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(DynamicIslandModule, NSObject)

RCT_EXTERN_METHOD(testFunc:(NSString *) title withMessage:(NSString *) b
                  withResolver:(RCTPromiseResolveBlock) resolve
                  withRejecter:(RCTPromiseRejectBlock) reject)

// Notification
RCT_EXTERN_METHOD(startNotificationActivity:(NSString *) title withMessage:(NSString *) message)
RCT_EXTERN_METHOD(updateNotificationActivity:(NSString *) message)
RCT_EXTERN_METHOD(endNotificationActivity)

// FoodOrder
RCT_EXTERN_METHOD(startFoodOrderActivity:(NSString *) title withMessage:(NSString *) message withImage:(NSString *) image)
RCT_EXTERN_METHOD(updateFoodOrderActivity:(NSString *) message)
RCT_EXTERN_METHOD(endFoodOrderActivity)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
