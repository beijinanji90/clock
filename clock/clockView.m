//
//  clockView.m
//  clock
//
//  Created by chenfenglong on 16/9/13.
//  Copyright © 2016年 chenfenglong. All rights reserved.
//

#import "clockView.h"

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
//每一秒旋转6度
#define perSecondA 6
//每一分旋转
#define perMinA 6
//每一小时旋转30
#define perHourA 30
//第一分时针旋转的度数
#define perMinHour 0.5

@interface clockView ()

@property (nonatomic,weak) CALayer *hourLay;

@property (nonatomic,weak) CALayer *minLay;

@property (nonatomic,weak) CALayer *secLay;

@end


@implementation clockView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.image = [UIImage imageNamed:@"clock"];
        [self addHour];
        [self addMin];
        [self addSec];
        [self addTimer];
    }
    return self;
}

- (void)addTimer
{
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(timerClick)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)timerClick
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dateComponents = [calendar components:NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:[NSDate date]];
    
    NSInteger hour = dateComponents.hour;
    NSInteger min = dateComponents.minute;
    NSInteger sec = dateComponents.second;
//    NSLog(@"%d ~ %d ~ %d",hour,min,sec);
    
    CGFloat hourA = DEGREES_TO_RADIANS(hour * 1.0 / 24 * 360);
    hourA = hour * perHourA + min * perMinHour;
    self.hourLay.affineTransform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(hourA));
    
    CGFloat minA = DEGREES_TO_RADIANS(min * 1.0 / 60 * 360);
    minA = min * perMinA;
    self.minLay.affineTransform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(minA));
    
    CGFloat secA = DEGREES_TO_RADIANS(sec * 1.0 / 60 * 360);
    secA = sec * perSecondA;
    self.secLay.affineTransform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(secA));
}

- (void)addHour
{
    CALayer *hourLay = [[CALayer alloc] init];
    hourLay.bounds = CGRectMake(0, 0, 4, 60);
    hourLay.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    hourLay.backgroundColor = [[UIColor blackColor] CGColor];
    hourLay.anchorPoint = CGPointMake(0.5, 0.95);
    [self.layer addSublayer:hourLay];
    self.hourLay = hourLay;

}

- (void)addMin
{
    CALayer *minLay = [[CALayer alloc] init];
    minLay.bounds = CGRectMake(0, 0, 3, 70);
    minLay.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    minLay.backgroundColor = [[UIColor blackColor] CGColor];
    minLay.anchorPoint = CGPointMake(0.5, 0.9);
    [self.layer addSublayer:minLay];
    self.minLay = minLay;
}

- (void)addSec
{
    CALayer *secLay = [[CALayer alloc] init];
    secLay.bounds = CGRectMake(0, 0, 2, 80);
    secLay.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    secLay.backgroundColor = [[UIColor redColor] CGColor];
    secLay.anchorPoint = CGPointMake(0.5, 0.9);
    [self.layer addSublayer:secLay];
    self.secLay = secLay;
}


@end
