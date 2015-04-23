//
//  ReplaceMethodHolder.m
//  RuntimeDemo
//
//  Created by zjsruxxxy3 on 15/4/23.
//  Copyright (c) 2015年 WR. All rights reserved.
//

#import "ReplaceMethodHolder.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation ReplaceMethodHolder
+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSLog(@"%s",__func__);
        [ReplaceMethodHolder hackForFucntion];
        
    });
}

- (void)hack_setTitle:(NSString *)title forState:(UIControlState)state
{
//    [self hack_setTitle:@"lili" forState:UIControlStateNormal];
    NSLog(@"lili--------");
    
}
// default is nil. title is assumed to be single line
+(void)hackForFucntion
{
    
    Method oldM = class_getInstanceMethod([UIButton class], @selector(setTitle:forState:));
    
    Method newM = class_getInstanceMethod([ReplaceMethodHolder class], @selector(hack_setTitle:forState:));
    
    method_setImplementation(oldM, method_getImplementation(newM));
    
//    method_setImplementation(newM, method_getImplementation(oldM));
    
    
}

@end
