//
//  Person+WR.m
//  RuntimeDemo
//
//  Created by zjsruxxxy3 on 15/4/24.
//  Copyright (c) 2015年 WR. All rights reserved.
//

#import "Person+WR.h"

@implementation Person (WR)

static NSInteger hei;

-(void)setHeigth:(NSInteger)heigth
{
#pragma key 取地址，不会对hei进行赋值操作
    objc_setAssociatedObject(self, &hei, @(heigth), OBJC_ASSOCIATION_ASSIGN);
    
}

-(NSInteger)heigth
{
#warning 返回值类型一定要匹配！！！！
    return  [objc_getAssociatedObject(self,&hei) longValue];
    
}

-(NSString *)description
{
    NSLog(@"%@--%ld--%@",self.name,self.heigth,self);
    
    return nil;
    
}
@end
