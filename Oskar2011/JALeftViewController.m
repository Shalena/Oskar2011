//
//  JALeftViewController.m
//  Oskar2011
//
//  Created by shustreek on 14.02.16.
//  Copyright (c) 2016 shustreek. All rights reserved.
//









#import "JALeftViewController.h"
#import "JASidePanelController.h"

#import "NomineeViewController.h"


#import "UIViewController+JASidePanel.h"
#import "NominationListViewController.h"



@interface JALeftViewController ()

@property (nonatomic, weak) UILabel *label;
@property (nonatomic, weak) UIButton *hide;
@property (nonatomic, weak) UIButton *show;
@property (nonatomic, weak) UIButton *goHome;
@property (nonatomic, weak) UIButton *goToAddNominee;
@property (nonatomic, weak) UIButton *changeCenterPanel;

@end

@implementation JALeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    UILabel *label  = [[UILabel alloc] init];
    label.font = [UIFont boldSystemFontOfSize:20.0f];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"Left Panel";
    [label sizeToFit];
    label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:label];
    self.label = label;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 70.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button setTitle:@"Go Home" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(_goHome) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.hide = button;
    
        button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 120.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button setTitle:@"Add nominee" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(_goToAddNominee) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.goHome = button;
    
   
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 170.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    [button setTitle:@"Change Center Panel" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(_changeCenterPanelTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.changeCenterPanel = button;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.label.center = CGPointMake(floorf(self.sidePanelController.leftVisibleWidth/2.0f), 25.0f);
}

#pragma mark - Button Actions
- (void)_goHome {
  [self.sidePanelController showCenterPanelAnimated:(YES)];
    
}
- (void)_goToAddNominee{
    
    NomineeViewController *controller = ( NomineeViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"NomineeViewController"];
    
    UINavigationController *navController = (UINavigationController *) self.sidePanelController.centerPanel;
    NominationListViewController *listViewController = navController.viewControllers.firstObject;
    
    controller.nominations = listViewController.nominations;
    

    [navController pushViewController:controller animated:YES];
    [self.sidePanelController showCenterPanelAnimated:(YES)];

}



- (void)_removeRightPanelTapped:(id)sender {
    self.sidePanelController.rightPanel = nil;
    self.goHome.hidden = YES;
    self.goToAddNominee.hidden = NO;
}



@end