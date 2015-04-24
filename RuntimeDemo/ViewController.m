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
    
    [self addViewClassNow];
    
    
    
}

void reportIMP(id self,SEL _cmd)
{
 
    NSLog(@"this object is %p",self);
    
    NSLog(@"class is %@,and super is %@",[self class],[self superclass]);
    Class currentClass = [self class];
    
//    for (int i = 1; i<10; i++)
//    {
        NSLog(@"following the isa pointer %@ times give %p",currentClass,currentClass);
    
    NSLog(@"nsobject metaclass %p",objc_getMetaClass("WRCJView"));

    
    NSLog(@"following the isa pointer %@ times give %p",[currentClass superclass],[currentClass superclass]);
    
    NSLog(@"following the isa pointer %@ times give %p",[[currentClass superclass]superclass],[[currentClass superclass]superclass]);
    
    NSLog(@"following the isa pointer %@ times give %p",[[[currentClass superclass]superclass]superclass],[[[currentClass superclass]superclass]superclass]);
    
    
    NSLog(@"nsobject metaclass %p",objc_getMetaClass("NSObject"));
    
}

-(void)addViewClassNow
{
    //创建自己的类,继承uiview
    Class myClass = objc_allocateClassPair([UIView class], "WRCJView", 0    );

    class_addMethod(myClass, @selector(report), (IMP)reportIMP, "cj");
    
    // 注册这个类
    objc_registerClassPair(myClass);
    
    id wrcj = [[myClass alloc]init];
    
    [wrcj performSelector:@selector(report)];
    
    
    
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
