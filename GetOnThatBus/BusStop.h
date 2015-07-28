//
//  BusStop.h
//  GetOnThatBus
//
//  Created by Jaehee Chung on 7/28/15.
//  Copyright (c) 2015 Jaehee Chung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface BusStop : NSObject

@property NSString *routes;
@property NSString *_address;
@property NSString *cta_stop_name;
@property CLLocationCoordinate2D stopCoordinate;
@property NSString *inter_modal;




@end
