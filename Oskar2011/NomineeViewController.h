//
//  NomineeViewController.h
//  Oskar2011
//
//  Created by shustreek on 18.12.15.
//  Copyright (c) 2015 shustreek. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OSNominees;
@protocol NomineeViewControllerDelegate;
@interface NomineeViewController : UIViewController

@property (weak, nonatomic) id<NomineeViewControllerDelegate> delegate;//делегатом является любой объект который поддерживает этот протокол
@property (strong, nonatomic) OSNominees * nominee;
@property (strong, nonatomic) OSNominees *currentNominee;
@property (strong, nonatomic) NSArray *nominations;
@end


@protocol NomineeViewControllerDelegate <NSObject>

- (void)addNomineeControllerDidCreateNominee:(OSNominees *)nominee;//создался фильм
- (void)addNomineeControllerDidUpdateNominee;// обновился фильм




@end









