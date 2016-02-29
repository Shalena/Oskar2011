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



@interface JALeftViewController ()<UITableViewDataSource>

@property (nonatomic, weak) UILabel *label;
@end

@implementation JALeftViewController
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    [ self.view addSubview:self.tableView];


}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    return 3;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = nil;
    
    if ([tableView isEqual:self.tableView]){
        static NSString *tableViewCellIdentifier = @"myCells";
        cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
    
         if (cell == nil) {
             cell = [[UITableView alloc]
                     initWithStyle:UITableViewCellStyleDefault
                     reuseIdentifier:tableViewCellIdentifier];
         }
         cell.textLabel.text = [NSString stringWithFormat:@ "Section %ld,
                                                            Cell %ld",
                                                (long)indexPath.section
                                                (long)indexPath.row];
        }
         return cell;
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







@end