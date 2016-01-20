//
//  NominationViewController.h
//  Oskar2011
//
//  Created by shustreek on 09.12.15.
//  Copyright (c) 2015 shustreek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSNomination.h"

@interface NominationViewController : UITableViewController
@property (strong, nonatomic) OSNomination * nomination;

- (void) doSomething: (NSString *) newTitle;
- (void)changeAscending:(BOOL)ascending;
- (void)sortByDate:(BOOL)ascending;
- (void)sortByName:(BOOL)ascending;
@end
