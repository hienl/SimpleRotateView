//
//  TransitionView.h
//  SimpleRotate
//
//  Created by 大坪 五郎 on 2013/11/04.
//  Copyright (c) 2013年 GoroOtsubo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransitionView : UIView

- (id)initWithFrame:(CGRect)frame firstView:(UIView*) firstView secondView:(UIView*) secondView;
-(void)changeViewType:(NSString*) type subtype:(NSString*) subtype duration:(float) duration
;
@end
