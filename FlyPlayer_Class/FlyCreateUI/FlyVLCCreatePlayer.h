//
//  FlyVLCCreatePlayer.h
//  FLY_VLC_Class
//
//  Created by Fly on 15/7/10.
//  Copyright (c) 2015年 Fly. All rights reserved.
//
//注：Fly李飞翔版权所有
//

#import <UIKit/UIKit.h>

@interface FlyVLCCreatePlayer : UIViewController
+(UIView*)FlyCreatePlayerX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h TopBarColor:(UIColor*)topColor BottomBarColor:(UIColor*)bottomColor PlayButtonImageName:(NSString*)playImageName PauseButtonImageName:(NSString*)pauseImageName SliderImageName:(NSString*)sliderImageName LeftSliderColor:(UIColor*)LeftSliderColor RightSliderColor:(UIColor*)RightSliderColor MaxImageName:(NSString*)MaxImageName MinImageName:(NSString*)MinImageName PlayPath:(NSString*)playPath PlayPathIsWebsite:(BOOL)IsWebsite AddView:(UIView*)addView selfName:(id)sf;
@end











