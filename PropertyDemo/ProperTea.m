//
//  ProperTea.m
//  PropertyDemo
//
//  Created by Prashant Pukale on 06/03/18.
//  Copyright © 2018 Prashant Pukale. All rights reserved.
//

#import "ProperTea.h"

@interface ProperTea()
@property (nonatomic,assign,readwrite) BOOL available;
@end

static NSUInteger count = 0;
@implementation ProperTea
@synthesize name = _teaName;

- (instancetype)initWithName:(NSString*)name cost:(float)cost andAvailablity:(BOOL)isAvailable {
  if (self = [super init]) {
    // Always use the backing variables directly in the init method.
    // Follow the memory symantics for name variable.
    _teaName = [name copy];
    // By default price will be having a variable named `_price`
    _price = cost;
    _available = isAvailable;
    count++;
  }
  return self;
}

+ (NSUInteger)totalCount {
  return count;
}

- (void)resetAvailablity {
  self.available = false;
}

- (NSString*)description {
  return [NSString stringWithFormat:@"Name: %@ \nPrice = %.2f \n isAvailable %@", _teaName, _price, (self.isAvailable ? @"YES" : @"NO")];
}

- (instancetype)nextTeaBag {
  NSString *currentName = self.name;
  NSArray *comp = [currentName componentsSeparatedByString:@" "];
  int nxtValue = ((NSString*)comp[1]).intValue;
  nxtValue++;
  return [[ProperTea alloc] initWithName:[NSString stringWithFormat:@"%@ %d",comp[0],nxtValue] cost:self.price andAvailablity:self.isAvailable];
}

@end
