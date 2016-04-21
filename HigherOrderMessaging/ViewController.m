//
//  ViewController.m
//  HigherOrderMessaging
//
//  Created by Ashif Khan on 21/04/16.
//  Copyright © 2016 Local. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+HOM.h"

@interface ViewController ()
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    @autoreleasepool {
        #pragma plain HOM
        NSArray *myArray = @[@"INDIA", @"AUSTRALIA", @"BRITAIN", @"CHINA", @"JAPAN", @"THAILAND", @"FRANCE", @"BARZIL"];
        NSArray* result = [myArray homPlain:@selector(lowercaseString)];
        NSLog(@"%@",result);
    
        #pragma AKTrampoline
        NSArray *uppercasedStrings = (NSArray *)[[result perform] uppercaseString];
        NSLog(@"%@",uppercasedStrings);
        
        NSArray *floats = @[ @(3.14), @(2.71), @(0.577) ];
        NSArray *floatStrings = (NSArray *)[[floats perform] stringValue];
        NSLog(@"%@",floatStrings);
    
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end




