//
//  OSNomineesTableViewCell.m
//  Oskar2011
//
//  Created by shustreek on 17.12.15.
//  Copyright (c) 2015 shustreek. All rights reserved.
//

#import "OSNomineesTableViewCell.h"

@interface OSNomineesTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleNomineeLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyNomineeLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailNomineeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation OSNomineesTableViewCell


- (void)configureWithNominees:(OSNominees *)nominees
{
    self.titleNomineeLabel.text = nominees.title;
    self.companyNomineeLabel.text = nominees.company;
    self.detailNomineeLabel.text = nominees.detail;

    self.dateLabel.text = nominees.date.description;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end




    
    
    
    
