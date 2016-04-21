//
//  AKTrampoline.h
//  HigherOrderMessaging
//
//  Created by Ashif Khan on 21/04/16.
//  Copyright © 2016 Local. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKTrampoline : NSProxy {
    id _ak_target;
    SEL _ak_selector;
}
+ (id)trampolineWithTarget:aTarget selector:(SEL)newSelector;
@end