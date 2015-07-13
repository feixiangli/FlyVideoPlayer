//
//  FLYcreate.h
//  Fly121
//
//  Created by qianfeng on 15/6/13.
//  Copyright (c) 2015年 Fly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface FLYcreate : NSObject


// fly快速创建UI第三方库
// 创建单个控件

/**
 创建一个View

 
 功能说明：快速创建UIView UILabel  UIButton UIImagView
 ** 最后一个参数是添加到某个view上， 如需拿到控件这个可写nil，
 ** 返回值及是你需要的控件，可直接使用
 ** 返回值可要可不要 ，因为方法内整合了 addsubview方法
 **/

+(UIView*)flyViewX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h Color:(UIColor*)color Add:(UIView*)addView;
/**创建一个Label*/
+(UILabel*)flyLabelX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h Text:(NSString*)text  textColor:(UIColor*)TextColor font:(CGFloat)font Add:(UIView*)addView;
/**创建一个Button*/
+(UIButton*)flyButtonX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h Title:(NSString *)title TitleFont:(CGFloat)titlefont TitleColor:(UIColor *)titleColor BackgroundColor:(UIColor*)backgroundColor ImageName:(NSString *)imageName bgImageName:(NSString *)bgImageName Target:(id)Target action:(SEL)Action Add:(UIView *)addView;
/**创建一个View*/
+(UIImageView*)flyImageViewX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h imageName:(NSString*)imageName Add:(UIView*)addView;




// fly创建多个控件第三方库

// 一键多个控件使用方法：输入创建的个数和摆向。直接调用类方法，如想拿到每一个控件，1，使用tag值，2使用返回数组。
// 其余方法类似单个控件创建方法，不做重复。


/*
 创建多个控件
 
 */

/**创建多个Button*/
+(NSArray*)flyButtonNumaber:(int)num isX:(BOOL)isX FrameX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h Padding:(float)padding Titles:(NSArray*)title TitleFont:(CGFloat)titlefont TitleColor:(UIColor *)titleColor  BackgroundColor:(UIColor*)backgroundColor  ImageNames:(NSArray*)imageName bgImageNames:(NSArray*)bgImageName Tag:(NSInteger)tag Target:(id)Target action:(SEL)Action Add:(UIView *)addView;
/**创建多个Label*/
+(NSArray*)flyLabelNumaber:(int)num isX:(BOOL)isX FrameX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h Padding:(float)padding LabelTexts:(NSArray*)title textFont:(int)font textColor:(UIColor *)titleColor  Tag:(NSInteger)tag Add:(UIView *)addView;

@end

//参数:num控件个数，isx是否为横向，NO为竖向，其余参数同*单个控件类方法*

/*

 提前为你准备好的4个空数组 请CV大法
 
 NSArray*array1=@[@"",@"",@"",@"",@""];
 NSArray*array2=@[@"",@"",@"",@"",@""];
 NSArray*array3=@[@"",@"",@"",@"",@""];
 NSArray*array4=@[@"",@"",@"",@"",@""];
 
*/














