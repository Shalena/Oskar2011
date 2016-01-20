//
//  NominationListViewController.m
//  Oskar2011
//
//  Created by shustreek on 12.11.15.
//  Copyright (c) 2015 shustreek. All rights reserved.
//

#import "NominationListViewController.h"
#import "OSNomination.h"
#import "OSNominationsListCell.h"
#import "NominationViewController.h"



@interface NominationListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray *nominations;
@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

@implementation NominationListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"OscarNominees2011" ofType:@"json"];//бандл  - то место где будут лежать все файлы (все ресурсы)
    NSData *data = [NSData dataWithContentsOfFile:filePath options:NSDataReadingUncached error:nil];
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingOptions)kNilOptions error:nil];
    
    self.nominations = [OSNomination nominationsArrayFromJsonArray:json];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}
#pragma UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.nominations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OSNominationsListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nominationsCell"];
    OSNomination *nomination = self.nominations[indexPath.row];
  
    [cell configureWithNomination:nomination];
    
 
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"goToNomination"])
{
    
    NominationViewController *controller = segue.destinationViewController;
    OSNominationsListCell *cell = sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    controller.nomination = self.nominations[indexPath.row];
  
    
}

    
   // controller.title = [self.nominations[indexPath.row] title];//эта строчка работает!!!

    // для дошкольников
   /* NSInteger row = [indexPath row];// getter
    OSNomination * nomination = [self.nominations objectAtIndex:row];
    controller.title = [nomination title];
    */
    // а теперь эти же 3 строчки в одной
    //controller.title = [[self.nominations objectAtIndex:[indexPath row]] title];
    
}


- (void) setNaviTitle: (NSString *) title
{
   
    _naviBar.title = title;
}




- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    [self setNaviTitle: @"Oskar Nominations 2011"];
}


@end





















