//
//  NSArray+HOM.h
//  HigherOrderMessaging
//
//  Created by Ashif Khan on 21/04/16.
//  Copyright © 2016 Local. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSArray(HOM)
- (id)perform;
- (NSArray*)homPlain:(SEL)selector;
@end
