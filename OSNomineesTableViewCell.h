//
//  OSNomineesTableViewCell.h
//  Oskar2011
//
//  Created by shustreek on 17.12.15.
//  Copyright (c) 2015 shustreek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSNominees.h"

@interface OSNomineesTableViewCell : UITableViewCell
- (void)configureWithNominees:(OSNominees *)nominees;
@end

