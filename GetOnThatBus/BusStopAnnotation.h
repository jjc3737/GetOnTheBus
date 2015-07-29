//
//  BusStopAnnotation.h
//  GetOnThatBus
//
//  Created by Jaehee Chung on 7/28/15.
//  Copyright (c) 2015 Jaehee Chung. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "BusStop.h"

@interface BusStopAnnotation : MKPointAnnotation

@property BusStop *bustop; 

@end
