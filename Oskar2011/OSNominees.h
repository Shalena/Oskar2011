//
//  OSNominees.h
//  Oskar2011
//
//  Created by shustreek on 17.11.15.
//  Copyright (c) 2015 shustreek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OSNominees : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *company;
@property (strong, nonatomic) NSString *detail;
@property (copy, nonatomic) NSDate *date;

+ (NSArray *)nomineesArrayOfNomination:(NSArray *)array;
@end




