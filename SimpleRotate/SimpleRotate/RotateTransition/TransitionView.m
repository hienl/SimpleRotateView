//
//  TransitionView.m
//  SimpleRotate
//
//  Created by 大坪 五郎 on 2013/11/04.
//  Copyright (c) 2013年 GoroOtsubo. All rights reserved.
//

#import "TransitionView.h"

@interface TransitionView()

@property(nonatomic)UIView* firstView;
@property(nonatomic)UIView* secondView;

@end

@implementation TransitionView

//切り替える２種類のViewおよびframeを使って初期化
//initialization

- (id)initWithFrame:(CGRect)frame firstView:(UIView*) firstView secondView:(UIView*) secondView
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect subViewRect =CGRectMake(0,0,CGRectGetWidth(frame),CGRectGetHeight(frame));
        
        self.firstView = [[UIView alloc]initWithFrame:subViewRect];
        [self addSubview:_firstView];
        
        self.secondView = [[UIView alloc]initWithFrame:subViewRect];
        [self addSubview:_secondView];

        firstView.frame = subViewRect;
        [_firstView addSubview:firstView];

        secondView.frame = subViewRect;
        [_secondView addSubview:secondView];
    }
    return self;
}


//指定されたtypeとsubtypeを使ってdurationの時間をかけてviewを変更
//change view with specified type and subtype during "duration"

-(void)changeViewType:(NSString*) type subtype:(NSString*) subtype duration:(float) duration
{

    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = duration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = type;
    animation.subtype = subtype;
    
    
    NSUInteger firstIndex = [[self subviews] indexOfObject:_firstView];
    NSUInteger secondIndex = [[self  subviews] indexOfObject:_secondView];

    //ここでviewを切り替える
    //switch view here
    [ self exchangeSubviewAtIndex:secondIndex withSubviewAtIndex:firstIndex];
    
    [[self  layer] addAnimation:animation forKey:@"animation"];
    [[self  layer]setNeedsDisplay];
}


@end
