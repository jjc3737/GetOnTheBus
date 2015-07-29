//
//  DetailViewController.m
//  GetOnThatBus
//
//  Created by Jaehee Chung on 7/28/15.
//  Copyright (c) 2015 Jaehee Chung. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *routesLabel;
@property (weak, nonatomic) IBOutlet UILabel *intermodalLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpLabelsandTitle];
}

-(void)setUpLabelsandTitle {
    self.title = self.busStop.cta_stop_name;
    self.intermodalLabel.text = self.busStop.inter_modal;
    self.routesLabel.text = self.busStop.routes;
    self.addressLabel.text = @"Fix";
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
