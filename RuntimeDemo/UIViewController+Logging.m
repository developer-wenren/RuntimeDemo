//
//  UIViewController+Logging.m
//  RuntimeDemo
//
//  Created by zjsruxxxy3 on 15/4/23.
//  Copyright (c) 2015年 WR. All rights reserved.
//

#import "UIViewController+Logging.h"
#import "Logging.h"
#import <objc/runtime.h>
#import <objc/objc.h>
#import "Aspects.h"

@implementation UIViewController (Logging)

                   
+(void)load
{
    NSLog(@"Logging---load");
    
    swizzleMethod([self class], @selector(viewDidAppear:), @selector(swizzled_viewDidAppear:));
    
    NSError *error = nil;
    
    // 自动生成替换方法,去block中调用需要的方法
     [UIViewController aspect_hookSelector:@selector(viewWillTransitionToSize:withTransitionCoordinator:) withOptions:AspectPositionInstead usingBlock:^(id<AspectInfo> info){
        
        NSString *className = NSStringFromClass([[info instance]class]);
        
        [Logging logWithEventTime:className];
    
    } error:&error];

    
}

void swizzleMethod(Class cls, SEL originalSel, SEL swizzleSel)
{
    Method originalMethod = class_getInstanceMethod(cls, originalSel);
    
    Method swizzleMethod = class_getInstanceMethod(cls, swizzleSel);
    
    BOOL didAndMethod = class_addMethod(cls, originalSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    
    if (didAndMethod)
    {
        class_replaceMethod(cls, swizzleSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        
    }else
    {
        method_exchangeImplementations(originalMethod, swizzleMethod);
        
    }

}


-(void)swizzled_viewDidAppear:(BOOL)animated
{
    
    [self swizzled_viewDidAppear:animated];
    
//    [Logging logWithEventTime:NSStringFromClass([self class])];
    
}


@end
