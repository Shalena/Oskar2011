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
#import "JALeftViewController.h"
#import <JASidePanelController.h>

//#import "JARightViewController.h"

@interface NominationViewController ()

@property (strong, nonatomic) NSArray *buttons;
@property (strong, nonatomic) NSArray *filteredArray;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (weak, nonatomic) UIButton *someButton;
@property (weak, nonatomic) UIBarButtonItem *sortButton;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic) BOOL ascending;

@end

@implementation NominationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.nomination.title;
    self.textField.hidden = YES;
    self.textField.delegate = self;
    self.textField.returnKeyType = UIReturnKeyDefault;
  
#pragma mark Кнопка Find (скрыть/показать TextField)
    
    UIImage* image = [UIImage imageNamed:@"search.jpg"];
    CGRect frameimg = CGRectMake(0,0, 20,20);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image forState:UIControlStateNormal];
    [someButton addTarget:self
               action:@selector(hideTextField:)
     forControlEvents:UIControlEventTouchUpInside];
  
    UIBarButtonItem *sortButton =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    
 
   #pragma mark Кнопка Action Sheet (Sorting out)
    
    UIImage* image2 = [UIImage imageNamed:@"sorting"];
    CGRect frameimg2 = CGRectMake(0,0, 20,20);
    UIButton *someButton2 = [[UIButton alloc] initWithFrame:frameimg2];
    [someButton2 setBackgroundImage:image2 forState:UIControlStateNormal];
    [someButton2 addTarget:self
                   action:@selector(showActionSheet:)
         forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *filtrButton =[[UIBarButtonItem alloc] initWithCustomView:someButton2];
    NSArray *buttons = [[NSArray alloc] initWithObjects:self.addButton,sortButton,filtrButton, nil];
    self.navigationItem.rightBarButtonItems = buttons;
    [self showFiltred];
    [self.textField addTarget:self
                       action:@selector(showFiltred)
             forControlEvents:UIControlEventEditingChanged];
     }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.filteredArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OSNomineesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nomineesCell"];
    OSNominees *nominees = self.filteredArray[indexPath.row];
    
    [cell configureWithNominees:nominees];
    return cell;
}



#pragma mark - Actions

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"goToFilm"]) {
        NomineeViewController *controller = segue.destinationViewController;
        OSNomineesTableViewCell *cell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        controller.nominee = self.filteredArray[indexPath.row];
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
    self.filteredArray = [self.filteredArray sortedArrayUsingDescriptors:@[ sortDescriptor ]];
    [self.tableView reloadData];
}

- (void)sortByName:(BOOL)ascending {
  
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:ascending];
    self.filteredArray = [self.filteredArray sortedArrayUsingDescriptors:@[ sortDescriptor ]];
    [self.tableView reloadData];
}

- (void)sortByCompany:(BOOL)ascending {
  
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"company" ascending:ascending];
    self.filteredArray = [self.filteredArray sortedArrayUsingDescriptors:@[ sortDescriptor ]];
    [self.tableView reloadData];
}

- (void)sortByDetail:(BOOL)ascending {
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"detail" ascending:ascending];
    self.filteredArray = [self.filteredArray sortedArrayUsingDescriptors:@[ sortDescriptor ]];
    [self.tableView reloadData];
}

- (void)showActionSheet:(BOOL)ascending {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose the Sorting Type"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
      
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
#pragma mark Filtring

- (void)showFiltred {

    NSString *filtrString = self.textField.text;
    NSPredicate *myPredicate = [NSPredicate predicateWithFormat:@"title CONTAINS[cd] %@", filtrString];

    if (filtrString.length > 0) {
        
        self.filteredArray =  [self.nomination.nominees filteredArrayUsingPredicate:myPredicate];
        
    } else {
        self.filteredArray = self.nomination.nominees;
    }

    [self.tableView reloadData];
  
}

- (void)hideTextField:(BOOL)ascending
{
 
    self.ascending = !self.ascending;
    self.textField.hidden = !self.ascending;
 //   [self.textField becomeFirstResponder];//    вызывает клавиатуру, но в симуляторе  cmd+k
  }

- (void)showLeftPanel {

JALeftViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"JALeftViewController"];

}

@end

