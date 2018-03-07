//
//  ProperTea.h
//  PropertyDemo
//
//  Created by Prashant Pukale on 06/03/18.
//  Copyright © 2018 Prashant Pukale. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProperTea : NSObject

@property (nonatomic,copy,readonly) NSString *name;
@property (nonatomic,assign,readonly) float price;
@property (nonatomic,assign,readonly,getter=isAvailable) BOOL available;
@property (class,nonatomic,readonly) NSUInteger totalCount;

-(NSString*)description;
-(instancetype)nextTeaBag;
- (instancetype)initWithName:(NSString*)name cost:(float)cost andAvailablity:(BOOL)isAvailable;
@end
