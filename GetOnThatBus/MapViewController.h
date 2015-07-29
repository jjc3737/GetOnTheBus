//
//  MapViewController.h
//  GetOnThatBus
//
//  Created by Jaehee Chung on 7/28/15.
//  Copyright (c) 2015 Jaehee Chung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import <MapKit/MapKit.h>
#import "BusStopAnnotation.h"

@interface MapViewController : UIViewController <ModelDelegate, MKMapViewDelegate>
@property Model *model;


@end
