//
//  MapViewController.m
//  GetOnThatBus
//
//  Created by Jaehee Chung on 7/28/15.
//  Copyright (c) 2015 Jaehee Chung. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property NSArray *busStops;
@property MKPointAnnotation *busStopsAnnotation;
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setUpBustStopsAnnotation {
    for (BusStop *busStop in self.busStops) {
        self.busStopsAnnotation = [MKPointAnnotation new];
        self.busStopsAnnotation.coordinate = busStop.stopCoordinate;
        self.busStopsAnnotation.title = busStop.cta_stop_name;
        self.busStopsAnnotation.subtitle = busStop.routes;
        
        
    }
 
    
}



#pragma mark - Model Delegate Method

-(void)Model:(Model *)model busStopsFromServer:(NSMutableArray *)busStopArray {
    self.busStops = [busStopArray copy];
    
    //comparable to reload data?
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
