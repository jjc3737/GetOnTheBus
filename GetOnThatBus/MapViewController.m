//
//  MapViewController.m
//  GetOnThatBus
//
//  Created by Jaehee Chung on 7/28/15.
//  Copyright (c) 2015 Jaehee Chung. All rights reserved.
//

#import "MapViewController.h"
#import "DetailViewController.h"

@interface MapViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property NSArray *busStops;
@property BusStopAnnotation *busStopsAnnotation;
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpBustStopsAnnotation];
       [self zoomInToRightLocation];

}

-(void)setUpBustStopsAnnotation {
    for (BusStop *busStop in self.busStops) {
        self.busStopsAnnotation = [BusStopAnnotation new];
        self.busStopsAnnotation.coordinate = busStop.stopCoordinate;
        self.busStopsAnnotation.title = busStop.cta_stop_name;
        self.busStopsAnnotation.subtitle = busStop.routes;
        self.busStopsAnnotation.bustop = busStop;
        [self.mapView addAnnotation:self.busStopsAnnotation];
        
        
        //
    }

}

-(void)zoomInToRightLocation {
    BusStop *busStop = [self.busStops objectAtIndex:0];
    CLLocationCoordinate2D coordinate = busStop.stopCoordinate;
    [self.mapView setRegion:MKCoordinateRegionMake(coordinate, MKCoordinateSpanMake(0.5, 0.5))];

}
#pragma mark - MapView Delegate

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKAnnotationView *pin;
//If ([annotaion isEqual:self.busStopsAnnotation])
    
    pin = [MKAnnotationView new];
    pin.image = [UIImage imageNamed:@"pins"];
    pin.canShowCallout = YES;
    pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoDark];
    
    return pin;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {

    [self performSegueWithIdentifier:@"showDetail" sender:view];
    
}

#pragma mark - Model Delegate Method

-(void)Model:(Model *)model busStopsFromServer:(NSMutableArray *)busStopArray {
    self.busStops = [busStopArray copy];
    
    //comparable to reload data? Only when you are removing or moving annotation not when refreshing.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    
    DetailViewController *vc = segue.destinationViewController;
    MKAnnotationView *annotationView = sender;
    BusStopAnnotation *annotation = annotationView.annotation;
    vc.busStop = annotation.bustop;
    
}


@end
