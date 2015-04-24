//
//  main.m
//  RuntimeDemo
//
//  Created by zjsruxxxy3 on 15/4/23.
//  Copyright (c) 2015年 WR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Person.h"
#import "Person+WR.h"

int main(int argc, char * argv[]) {
    
    
    Person *haha = [[Person alloc]init];
    
    haha.name = @"haha";
    
    haha.heigth = 111;
    
    
//    NSLog(@"%@",haha);
    NSLog(@"%ld",haha.heigth);
    
    
    
    @autoreleasepool {
        
        
        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        
        
    }
}
