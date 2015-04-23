//
//  RuntimeDemo
//
//  Created by zjsruxxxy3 on 15/4/23.
//  Copyright (c) 2015年 WR. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface ViewController ()

@property(nonatomic,weak)UIButton *button;

@property (weak, nonatomic) IBOutlet UIButton *centerB;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [[UIButton alloc]init];
    
    [button setTitle:@"xixi" forState:UIControlStateNormal];
    
    self.button = button;
    
    [self.view addSubview:button];
    
    button.center = (CGPoint){160,300};

    
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
- (void)testRuntimeA
{
//    [array insertObject:foo atIndex:0];


//    objc_msgSend(array,@selector(insertObject:atIndex:),foo,5);
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
    
    
    // 利用运行时 替换 UIBUTTON的 setTitileForState方法！！！！！！
    [self.button setTitle:@"haha" forState:UIControlStateNormal];
    
    [self.centerB setTitle:@"wrcj" forState:UIControlStateNormal];
    
    self.centerB.backgroundColor = [UIColor yellowColor];
    
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    NSLog(@"%s",__func__);

}

-(id<UIViewControllerTransitionCoordinator>)transitionCoordinator
{

    NSLog(@"%s",__func__);
    
    return [super transitionCoordinator];
    
}

@end
