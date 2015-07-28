//
//  ListViewController.h
//  GetOnThatBus
//
//  Created by Jaehee Chung on 7/28/15.
//  Copyright (c) 2015 Jaehee Chung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface ListViewController : UIViewController <ModelDelegate>
@property Model* model;
@end
