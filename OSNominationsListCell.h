//
//  OSNominationsListCell.h
//  Oskar2011
//
//  Created by shustreek on 07.12.15.
//  Copyright (c) 2015 shustreek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSNomination.h"

@interface OSNominationsListCell : UITableViewCell
 - (void)configureWithNomination:(OSNomination *)nomination;
@end



