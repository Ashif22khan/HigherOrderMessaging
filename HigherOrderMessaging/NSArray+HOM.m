//
//  NSArray+HOM.m
//  HigherOrderMessaging
//
//  Created by Ashif Khan on 21/04/16.
//  Copyright © 2016 Local. All rights reserved.
//

#import "NSArray+HOM.h"
#import "AKTrampoline.h"
@implementation NSArray(HOM)

- (NSArray *)perform:(NSInvocation *)anInvocation {
    NSMutableArray *resultArray = [NSMutableArray array];
    for (id obj in self) {
        __unsafe_unretained id resultObject;
        [anInvocation invokeWithTarget:obj];
        [anInvocation getReturnValue:&resultObject];
        [resultArray addObject:resultObject];
    }
    return resultArray;
}

- (id)perform {
    return [AKTrampoline trampolineWithTarget:self selector:@selector(perform:)];
}

- (NSArray*)homPlain:(SEL)selector{
    NSMutableArray* resultArray = [NSMutableArray array];
    for(id object in self){
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        __unsafe_unretained id resultObject = [object performSelector:selector];
        [resultArray addObject:resultObject];
        #pragma clang diagnostic pop
    }
    return resultArray;
}
@end
