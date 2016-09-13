//
//  ViewController.m
//  clock
//
//  Created by chenfenglong on 16/9/13.
//  Copyright © 2016年 chenfenglong. All rights reserved.
//

#import "ViewController.h"
#import "clockView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat WH = 200;
    CGFloat x = (self.view.frame.size.width - WH) / 2;
    CGFloat y = (self.view.frame.size.height - WH) / 2;
    clockView *clock = [[clockView alloc] initWithFrame:CGRectMake(x, y, WH, WH)];
    [self.view addSubview:clock];
    // Do any additional setup after loading the view, typically from a nib.
}



@end
