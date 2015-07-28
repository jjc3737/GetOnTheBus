//
//  Model.m
//  GetOnThatBus
//
//  Created by Jaehee Chung on 7/28/15.
//  Copyright (c) 2015 Jaehee Chung. All rights reserved.
//

#import "Model.h"
@interface Model()

@property NSURL *jsonURL;

@end
@implementation Model

-(instancetype)init {
    if (self = [super init]) {
        _jsonURL = [NSURL URLWithString:@"https://s3.amazonaws.com/mmios8week/bus.json"];
    }
    
    return self;
}

-(void)fetchData {
    [[[NSURLSession sharedSession] dataTaskWithURL:self.jsonURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *rows = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray *busStops = [rows objectForKey:@"row"];
        [self makeBusStops:busStops];
    }] resume];
    
    
}

-(void)makeBusStops:(NSArray *)stops {
    self.busStops = [[NSMutableArray alloc] init];
    for (NSDictionary *stop in stops) {
        BusStop *busStop = [[BusStop alloc] init];
        busStop.routes = [stop objectForKey:@"routes"];
        busStop._address = [stop objectForKey:@"_address"];
        busStop.cta_stop_name = [stop objectForKey:@"cta_stop_name"];
        busStop.inter_modal = [stop objectForKey:@"inter_modal"];
        busStop.stopCoordinate = [self changeTwoStringsIntoCoordinateWithLongitude:[stop objectForKey:@"longitude"] lat:[stop objectForKey:@"latitude"]];
        
        [self.busStops addObject:busStop];
    }
    
    [self.delegate Model:self busStopsFromServer:self.busStops];
    
    
}

-(CLLocationCoordinate2D)changeTwoStringsIntoCoordinateWithLongitude: (NSString *)longitude lat: (NSString *)latitude {
    double longitudeDouble = [longitude doubleValue];
    double latDouble = [latitude doubleValue];
    
    return CLLocationCoordinate2DMake(latDouble, longitudeDouble);
}

//@property NSString *routes;
//@property NSString *_address;
//@property NSString *cta_stop_name;
//@property CLLocationCoordinate2D *stopCoordinate;
//@property NSString *inter_modal;

@end
