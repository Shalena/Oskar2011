//
//  OSNomination.m
//  Oskar2011
//
//  Created by shustreek on 12.11.15.
//  Copyright (c) 2015 shustreek. All rights reserved.
//

#import "OSNomination.h"
#import "OSNominees.h"

@implementation OSNomination
+ (NSArray *)nominationsArrayFromJsonArray:(NSArray *)array {
    NSMutableArray *result = [NSMutableArray array];
    
    for (NSDictionary *dictionary in array) {
        OSNomination *nomination = [[OSNomination alloc] init];
        nomination.title = dictionary[@"title"];
        nomination.nominees = [OSNominees nomineesArrayOfNomination:dictionary[@"nominees"]];
                [result addObject:nomination];
    }
    
    return result;
}


@end









