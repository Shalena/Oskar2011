//
//  NominationListViewController.h
//  Oskar2011
//
//  Created by shustreek on 12.11.15.
//  Copyright (c) 2015 shustreek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NominationListViewController : UIViewController
@property (weak, nonatomic) IBOutlet UINavigationItem *naviBar;
@property (strong, nonatomic) NSArray *nominations;
- (void) setNaviTitle: (NSString *) title;
@end
