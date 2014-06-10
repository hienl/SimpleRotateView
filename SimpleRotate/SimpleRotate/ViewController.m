//
//  ViewController.m
//  SimpleRotate
//
//  Created by 大坪 五郎 on 2013/11/04.
//  Copyright (c) 2013年 GoroOtsubo. All rights reserved.
// Photos coutesy of http://public-domain-photos.com
//

#import "ViewController.h"
#import "TransitionView.h"
@interface ViewController ()

@property(nonatomic)UIImageView* imageView;             //一枚目のUIImageView
@property(nonatomic)UIImageView* other_imageView;       //二枚目のUIImageView
@property(nonatomic) TransitionView* transitionView;    //切り替えるためのView

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //一枚目のUIImageView first UIImageView
    self.imageView = [[UIImageView alloc]init];
    _imageView.image = [UIImage imageNamed:@"la.jpg"];

    //二枚目のUIImageView second UIImageView
    self.other_imageView = [[UIImageView alloc]init];
    _other_imageView.image =[UIImage imageNamed:@"death-valley.jpg"];

	// 初期画面の作成 //setup initial view
    self.transitionView = [[TransitionView alloc]initWithFrame:CGRectMake(0,0,320,320) firstView:_imageView secondView:_other_imageView];
    [self.view addSubview:_transitionView];
    
    UIButton* transButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [transButton setTitle:@"Rotate" forState:UIControlStateNormal];
    transButton.frame = CGRectMake(0,
                                       340,
                                       100,
                                       50);
    
    //transButtonが押されたら、rotate:を呼び出す
    //when transButton is pushed, call rotate:
    [transButton addTarget:self action:@selector(rotate:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:transButton];
}


-(void) rotate:(id)sender
{
    [_transitionView changeViewType:@"cube" subtype:kCATransitionFromLeft duration:1.0];
    
//  ref http://stackoverflow.com/questions/1224580/different-types-of-catransition-types-available-in-iphone-sdk
    
//    type for Transition
//    NSString * const kCATransitionFade;
//    NSString * const kCATransitionMoveIn;
//    NSString * const kCATransitionPush;
//    NSString * const kCATransitionReveal;
//    @"cameraIris"
//    @"cameraIrisHollowOpen"
//    @"cameraIrisHollowClose"
//    @"cube"
//    @"alignedCube"
//    @"flip"
//    @"alignedFlip"
//    @"oglFlip"
//    @"rotate"
//    @"pageCurl"
//    @"pageUnCurl"
//    @"rippleEffect"
//    @"suckEffect"
    
    
//    subtype ref:CATransition
//    NSString * const kCATransitionFromRight;
//    NSString * const kCATransitionFromLeft;
//    NSString * const kCATransitionFromTop;
//    NSString * const kCATransitionFromBottom;
}

@end
