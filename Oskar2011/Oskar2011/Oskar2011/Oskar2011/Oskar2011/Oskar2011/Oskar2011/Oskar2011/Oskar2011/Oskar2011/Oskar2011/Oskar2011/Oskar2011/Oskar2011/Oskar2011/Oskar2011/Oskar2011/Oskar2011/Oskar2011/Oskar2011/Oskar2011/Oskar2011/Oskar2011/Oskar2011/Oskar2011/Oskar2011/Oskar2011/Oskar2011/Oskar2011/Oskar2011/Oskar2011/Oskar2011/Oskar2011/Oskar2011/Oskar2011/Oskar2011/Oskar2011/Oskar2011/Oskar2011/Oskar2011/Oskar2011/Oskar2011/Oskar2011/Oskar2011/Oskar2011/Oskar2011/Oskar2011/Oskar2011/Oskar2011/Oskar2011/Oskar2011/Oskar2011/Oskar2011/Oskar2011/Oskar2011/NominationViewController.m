//
//  NominationViewController.m
//  Oskar2011
//
//  Created by shustreek on 09.12.15.
//  Copyright (c) 2015 shustreek. All rights reserved.
//

#import "NominationViewController.h"
#import "NominationListViewController.h"
#import "OSNominees.h"
#import "OSNomineesTableViewCell.h"
#import "NomineeViewController.h"
#import "OSNomination.h"

@interface NominationViewController ()
@property (strong, nonatomic) NSArray *array;
//@property (nonatomic) BOOL ascending;

@end

@implementation NominationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.nomination.title;
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoLight];// 1) эта строчка работает!!!
//    
//   // Добавить на нее нужный target-action
//    [button addTarget:self action:@selector(info) forControlEvents:UIControlEventTouchUpInside];
//    
//   // Инициализировать ею UIBarButtonItem
//    //UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:button]; self.navigationItem.leftBarButtonItem = leftButton; 2) эта строчка работает!!!
//   UIBarButtonItem *sortButton = [[UIBarButtonItem alloc] initWithCustomView:button]; self.navigationItem.rightBarButtonItem = sortButton;
//    
    
    
    
    UIImage* image3 = [UIImage imageNamed:@"back_button.png"];
    CGRect frameimg = CGRectMake(15,5, 25,25);
    
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image3 forState:UIControlStateNormal];
    [someButton addTarget:self action:@selector(Back_btn:)
         forControlEvents:UIControlEventTouchUpInside];
    [someButton setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *mailbutton =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.leftBarButtonItem =mailbutton;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.nomination.nominees.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OSNomineesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nomineesCell"];
    OSNominees *nominees = self.nomination.nominees[indexPath.row];
    
    [cell configureWithNominees:nominees];
    
    
    return cell;
}



#pragma mark - Actions

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"goToFilm"]) {
        NomineeViewController *controller = segue.destinationViewController;
        OSNomineesTableViewCell *cell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        controller.nominee = self.nomination.nominees[indexPath.row];
        controller.delegate = self;
    } else if ([segue.identifier isEqualToString:@"addFilm"]) {
        NomineeViewController *controller = segue.destinationViewController;
        controller.delegate = self;
    }
}


- (void)addNomineeControllerDidCreateNominee:(OSNominees*)nominee{
    self.nomination.nominees = [self.nomination.nominees arrayByAddingObject:nominee];
   [self.tableView reloadData];
}

- (void)addNomineeControllerDidUpdateNominee {
    [self.tableView reloadData];
}




@end


