//
//  OSNominees.m
//  Oskar2011
//
//  Created by shustreek on 17.11.15.
//  Copyright (c) 2015 shustreek. All rights reserved.
//

#import "OSNominees.h"

@implementation OSNominees

+ (NSArray *)nomineesArrayOfNomination:(NSArray *)array {
    NSMutableArray *result = [NSMutableArray array];
    
    for (NSDictionary *dictionary in array) {
        OSNominees *nominees = [[OSNominees alloc] init];
     nominees.title  = dictionary[@"title"];
     nominees.company = dictionary[@"company"];
     nominees.detail = dictionary[@"detail"];
      nominees.date = [NSDate date];
        [result addObject:nominees];
    }
    
    return result;
}

@end
