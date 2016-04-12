//
//  JALeftViewController.m
//  Oskar2011
//
//  Created by shustreek on 14.02.16.
//  Copyright (c) 2016 shustreek. All rights reserved.
//









#import "JALeftViewController.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

#import "NominationListViewController.h"

#import "NomineeViewController.h"



@interface JALeftViewController ()<UITableViewDataSource>


@end

@implementation JALeftViewController


- (void)viewDidLoad {
    [super viewDidLoad];
 
    
   }




- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        [self _goToAddNominee];
    }
}


@end