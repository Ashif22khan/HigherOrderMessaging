//
//  AKTrampoline.m
//  HigherOrderMessaging
//
//  Created by Ashif Khan on 21/04/16.
//  Copyright © 2016 Local. All rights reserved.
//

#import "AKTrampoline.h"

@implementation AKTrampoline

- (void)forwardInvocation:(NSInvocation*)anInvocation {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    id result = [_ak_target performSelector:_ak_selector withObject:anInvocation];
    [anInvocation setReturnValue:&result];
#pragma clang diagnostic pop
}

- (id)methodSignatureForSelector:(SEL)aSelector {
    return [[_ak_target objectAtIndex:0] methodSignatureForSelector:aSelector];
}

- (id)_ak_initWithTarget:aTarget selector:(SEL)aSelector {
    _ak_target = aTarget;
    _ak_selector = aSelector;
    return self;
}

+ (id)trampolineWithTarget:aTarget selector:(SEL)aSelector {
    return [[self alloc] _ak_initWithTarget:aTarget selector:aSelector];
}
@end
