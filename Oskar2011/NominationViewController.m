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
@property (strong, nonatomic) NSArray *buttons;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (weak, nonatomic) UIButton *someButton;
@property (weak, nonatomic) UIBarButtonItem *sortButton;

@property (nonatomic) BOOL ascending;


@end

@implementation NominationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.nomination.title;
    
   
    // Кнопка сортировки
    
    UIImage* image = [UIImage imageNamed:@"owl.jpg"];
    CGRect frameimg = CGRectMake(0,0, 20,20);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image forState:UIControlStateNormal];
    [someButton addTarget:self
               action:@selector(changeAscending:)
     forControlEvents:UIControlEventTouchUpInside];
    // [self.view addSubview:someButton];

    UIBarButtonItem *sortButton =[[UIBarButtonItem alloc] initWithCustomView:someButton];
   // self.navigationItem.rightBarButtonItem = sortButton;
    
  
   
    NSArray *buttons = [[NSArray alloc] initWithObjects:self.addButton,sortButton,nil];
    self.navigationItem.rightBarButtonItems = buttons;
   
    
    
    
    
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



#pragma mark - Sorting

- (void)changeAscending:(BOOL)ascending
{
    self.ascending = !self.ascending;
    [self showActionSheet:self.ascending];
    
}

- (void)changeAscendingForSortingByName:(BOOL)ascending
{
    self.ascending = !self.ascending;
    [self sortByName:self.ascending];
    
}

- (void)changeAscendingForSortingByCompany:(BOOL)ascending
{
    self.ascending = !self.ascending;
    [self sortByCompany:self.ascending];
    
}

- (void)changeAscendingForSortingByDetail:(BOOL)ascending
{
    self.ascending = !self.ascending;
    [self sortByDetail:self.ascending];
    
}


- (void)sortByDate:(BOOL)ascending {
   
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:ascending];
    self.nomination.nominees = [self.nomination.nominees sortedArrayUsingDescriptors:@[ sortDescriptor ]];
    [self.tableView reloadData];
}


- (void)sortByName:(BOOL)ascending {
    
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:ascending];
    self.nomination.nominees = [self.nomination.nominees sortedArrayUsingDescriptors:@[ sortDescriptor ]];
    [self.tableView reloadData];
}


- (void)sortByCompany:(BOOL)ascending {
    
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"company" ascending:ascending];
    self.nomination.nominees = [self.nomination.nominees sortedArrayUsingDescriptors:@[ sortDescriptor ]];
    [self.tableView reloadData];
}


- (void)sortByDetail:(BOOL)ascending {
    
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"detail" ascending:ascending];
    self.nomination.nominees = [self.nomination.nominees sortedArrayUsingDescriptors:@[ sortDescriptor ]];
    [self.tableView reloadData];
}


- (void)showActionSheet:(BOOL)ascending {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose the Sorting Type"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"Delete it"
      
                                                    otherButtonTitles:@"Sort By Title", @"Sort By Company", @"Sort By Detail", nil];
    actionSheet.tag = 1;
    
     [actionSheet showInView:self.view];
    
    
    
}

    
    - (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
        
        switch (actionSheet.tag) {
            case 1: {
                switch (buttonIndex) {
                    case 0:
                        [self changeAscendingForSortingByName:self.ascending];
                        break;
                    case 1:
                        [self changeAscendingForSortingByCompany:self.ascending];
                        break;
                    case 2:
                        [self changeAscendingForSortingByDetail:self.ascending];
                        break;
                                        default:
                        break;
                }
                break;
            }
            default:
                break;
        }
    }
    
    
    

@end











