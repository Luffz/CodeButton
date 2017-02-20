//
//  CodeButton.m
//  HuanYin
//
//  Created by Suteki on 15/11/30.
//  Copyright © 2015年 Baidu. All rights reserved.
//

#import "CodeButton.h"

@interface CodeButton()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) int seconds;

@end


@implementation CodeButton

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)removeFromSuperview {
    [self.timer invalidate];
    self.timer = nil;
    
    [super removeFromSuperview];
}

- (void)startCountdown {
    [self.timer invalidate];
    
    _seconds = 60;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
}

- (void)updateTimer {
    _seconds--;
    
    if (_seconds <= 0) {
        [self.timer invalidate];
        self.timer = nil;
        
        self.userInteractionEnabled = YES;
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
    }else {
        self.userInteractionEnabled = NO;
        [self setTitle:[NSString stringWithFormat:@"%d秒后重发",_seconds] forState:UIControlStateNormal];
    }
}


@end
