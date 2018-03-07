//
//  main.m
//  PropertyDemo
//
//  Created by Prashant Pukale on 06/03/18.
//  Copyright © 2018 Prashant Pukale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProperTea.h"

@interface TeaFactory : NSObject
@property (nonatomic,strong) NSThread *manufacturingThread;
@property(nonatomic) ProperTea *nonatomicTea;
@property ProperTea *atomicTea;
@end

@implementation TeaFactory

- (instancetype)init {
  if (self = [super init]) {
    _manufacturingThread = [[NSThread alloc] initWithTarget:self selector:@selector(manufactureTea) object:nil];
    _atomicTea = [[ProperTea alloc] initWithName:@"Atomic 1" cost:0.10 andAvailablity:YES];
    _nonatomicTea = [[ProperTea alloc] initWithName:@"NonAtomic 1" cost:0.20 andAvailablity:YES];
  }
  return self;
}
- (void)manufactureTea {
  while (1) {
    self.atomicTea = self.atomicTea.nextTeaBag;
    self.nonatomicTea = self.nonatomicTea.nextTeaBag;
  }
}

- (void)startManufacturing {
  [_manufacturingThread start];
}

- (void)stopManufacture {
  [_manufacturingThread cancel];
}

- (void)printState {
  NSLog(@"%@\n",self.atomicTea.description);
  NSLog(@"%@\n",self.nonatomicTea.description);
}

@end

int main(int argc, const char * argv[]) {
  @autoreleasepool {
      // insert code here...
    TeaFactory *factory = [[TeaFactory alloc] init];
    [factory startManufacturing];
    while (1) {
      [factory printState];
    }
  }
  return 0;
}
