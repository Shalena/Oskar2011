//
//  OSNomination.h
//  Oskar2011
//
//  Created by shustreek on 12.11.15.
//  Copyright (c) 2015 shustreek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OSNomination : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *nominees;

+ (NSArray *)nominationsArrayFromJsonArray:(NSArray *)array;

@end










