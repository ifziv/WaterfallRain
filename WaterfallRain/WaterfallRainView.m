//
//  WaterfallRainView.m
//  WaterfallRain
//
//  Created by zivInfo on 17/1/18.
//  Copyright © 2017年 xiwangtech.com. All rights reserved.
//

#import "WaterfallRainView.h"

@implementation WaterfallRainView


- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
        
        [self initOtherView];
    }
    
    return self;
}

-(void) initOtherView
{
    int xWeight = [UIScreen mainScreen].bounds.size.width;
    
    for (int labelCount = 0; labelCount <= xWeight / 20; labelCount++) {
        
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:[self createdLabelView:label withTag:labelCount withX:(0 + labelCount * 20)]];
        [self labelAnimation:label];

    }

    //跳过按钮
    CGFloat btnW = 60;
    CGFloat btnH = 30;
    UIButton *_countBtn = [[UIButton alloc] initWithFrame:CGRectMake(xWeight - btnW - 24, btnH, btnW, btnH)];
    [_countBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    _countBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_countBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _countBtn.backgroundColor = [UIColor colorWithRed:38 /255.0 green:38 /255.0 blue:38 /255.0 alpha:0.6];
    _countBtn.layer.cornerRadius = 4;
    [self addSubview:_countBtn];
    
    
//    [UIView beginAnimations:@"move" context:nil];
//    [UIView setAnimationDuration:2];
//    [UIView setAnimationDelegate:self];
//    //改变它的frame的x,y的值
//    label.frame=CGRectMake(100,100, 120,100);
//    [UIView commitAnimations];
}

-(UILabel *) createdLabelView:(UILabel *)label withTag:(int)labelTag withX:(int)x
{
    int yHeight = [UIScreen mainScreen].bounds.size.height;
    int y = arc4random() % yHeight;
    
    label.frame = CGRectMake(x, y, 20,200);
    label.tag = labelTag;
    label.text = [NSString stringWithFormat:@"%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n", arc4random() % 2, arc4random() % 2, arc4random() % 2, arc4random() % 2, arc4random() % 2, arc4random() % 2, arc4random() % 2, arc4random() % 2];
    label.numberOfLines = [label.text length];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor colorWithRed:55.0f/255.0f green:207.0f/255.0f blue:103.0f/255.0f alpha:1.0f];
    
    return label;
}

-(void) labelAnimation:(UILabel *)label
{
    int originY = label.frame.origin.y + 15.0f;
    int yHeight = [UIScreen mainScreen].bounds.size.height;

    if (originY >= yHeight) {
        label.frame = CGRectMake(label.frame.origin.x, - 50.0f, label.frame.size.width, label.frame.size.height);
    }
    else {
        label.frame = CGRectMake(label.frame.origin.x, originY, label.frame.size.width, label.frame.size.height);
    }

    [self performSelector:@selector(labelAnimation:) withObject:label afterDelay:0.15f];
    
}

// 移除广告页面
- (void)dismiss
{
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.alpha = 0.f;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
