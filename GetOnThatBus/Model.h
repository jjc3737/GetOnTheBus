//
//  Model.h
//  GetOnThatBus
//
//  Created by Jaehee Chung on 7/28/15.
//  Copyright (c) 2015 Jaehee Chung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BusStop.h"

@protocol ModelDelegate;
@interface Model : NSObject

@property (weak,nonatomic) id <ModelDelegate> delegate;
@property NSMutableArray *busStops;

-(void)fetchData ;
@end

@protocol ModelDelegate <NSObject>

-(void)Model:(Model *)model busStopsFromServer: (NSMutableArray *)busStopArray;

@end