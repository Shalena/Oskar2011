//
//  SidePanelController.m
//  Oskar2011
//
//  Created by shustreek on 14.02.16.
//  Copyright (c) 2016 shustreek. All rights reserved.
//

#import "SidePanelController.h"

@interface SidePanelController ()

@end

@implementation SidePanelController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) awakeFromNib
{
    [self setLeftPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"JALeftViewController"]];
    [self setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"CenterPanel"]];
    }
@end
