//
//  OSNominationsListCell.m
//  Oskar2011
//
//  Created by shustreek on 07.12.15.
//  Copyright (c) 2015 shustreek. All rights reserved.
//

#import "OSNominationsListCell.h"
@interface OSNominationsListCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end


@implementation OSNominationsListCell



- (void)configureWithNomination:(OSNomination *)nomination{
    self.titleLabel.text = nomination.title;
}
@end







