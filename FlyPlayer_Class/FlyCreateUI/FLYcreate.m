//
//  FLYcreate.m
//  Fly121
//
//  Created by qianfeng on 15/6/13.
//  Copyright (c) 2015年 Fly. All rights reserved.
//

#import "FLYcreate.h"

@implementation FLYcreate
+(UIView*)flyViewX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h Color:(UIColor*)color Add:(UIView*)addView
{
    UIView*view=[[UIView alloc]init];
    if(x&&y&&w&&h)
        view.frame=CGRectMake(x, y, w, h);
    if(color)
        view.backgroundColor=color;
    if(addView)
        [addView addSubview:view];
    return view;
}

+(UILabel*)flyLabelX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h Text:(NSString *)text textColor:(UIColor *)TextColor font:(CGFloat)font Add:(UIView *)addView
{
    
    UILabel*label=[[UILabel alloc]init];
    if(x&&y&&w&&h)
        label.frame=CGRectMake(x, y, w, h);
    if(text)
        label.text=text;
    if(TextColor)
        label.textColor=TextColor;
    if(font)
        label.font=[UIFont systemFontOfSize:font];
    if(addView)
        [addView addSubview:label];
    return label;
}

+(UIButton*)flyButtonX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h Title:(NSString *)title TitleFont:(CGFloat)titlefont TitleColor:(UIColor *)titleColor BackgroundColor:(UIColor*)backgroundColor ImageName:(NSString *)imageName bgImageName:(NSString *)bgImageName Target:(id)Target action:(SEL)Action Add:(UIView *)addView
{
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    if(x&&y&&w&&h)
        button.frame=CGRectMake(x, y, w, h);
    if(title)
        [button setTitle:title forState:UIControlStateNormal];
    if(titleColor)
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    if(imageName)
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    if(bgImageName)
        [button setImage:[UIImage imageNamed:bgImageName] forState:UIControlStateHighlighted];
    if(Target&&Action)
        [button addTarget:Target action:Action forControlEvents:UIControlEventTouchUpInside];
    if(addView)
        [addView addSubview:button];
    if(titlefont)
        button.titleLabel.font=[UIFont systemFontOfSize:titlefont];
    if(backgroundColor)
        button.backgroundColor=backgroundColor;

    return button;
}

+(UIImageView*)flyImageViewX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h imageName:(NSString *)imageName Add:(UIView *)addView
{
    UIImageView*imageView=[[UIImageView alloc]init];
    imageView.userInteractionEnabled=YES;
    if(x&&y&&w&&h)
        imageView.frame=CGRectMake(x, y, w, h);
    if(imageName)
        imageView.image=[UIImage imageNamed:imageName];
    if(addView)
        [addView addSubview:imageView];
    return imageView;
}

+(NSArray*)flyButtonNumaber:(int)num isX:(BOOL)isX FrameX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h Padding:(float)padding Titles:(NSArray*)title TitleFont:(CGFloat)titlefont TitleColor:(UIColor *)titleColor  BackgroundColor:(UIColor*)backgroundColor  ImageNames:(NSArray*)imageName bgImageNames:(NSArray*)bgImageName Tag:(NSInteger)tag Target:(id)Target action:(SEL)Action Add:(UIView *)addView
{
    NSMutableArray*ButtonArray=[[NSMutableArray alloc]init];
    for(int i=0;i<num;i++)
    {
        UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
        if(x&&y&&w&&h)
        {
            if(isX)
            {
                button.frame=CGRectMake(x+i*(w+padding), y, w, h);
            }
            else
            {
                button.frame=CGRectMake(x,y+i*(h+padding), w, h);
            }
        }
        if(title)
            [button setTitle:title[i] forState:UIControlStateNormal];
        if(titleColor)
            [button setTitleColor:titleColor forState:UIControlStateNormal];
        if(imageName)
            [button setImage:[UIImage imageNamed:imageName[i]] forState:UIControlStateNormal];
        if(bgImageName)
            [button setImage:[UIImage imageNamed:bgImageName[i]] forState:UIControlStateHighlighted];
        if(Target&&Action)
            [button addTarget:Target action:Action forControlEvents:UIControlEventTouchUpInside];
        if(addView)
            [addView addSubview:button];
        if(titlefont)
            button.titleLabel.font=[UIFont systemFontOfSize:titlefont];
        if(backgroundColor)
            button.backgroundColor=backgroundColor;
        button.tag=tag++;
        NSLog(@"*Fly Buttons Tag:%ld",button.tag);
        [ButtonArray addObject:button];
    }
    return ButtonArray;
}

+(NSArray*)flyLabelNumaber:(int)num isX:(BOOL)isX FrameX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h Padding:(float)padding LabelTexts:(NSArray*)title textFont:(int)font textColor:(UIColor *)titleColor  Tag:(NSInteger)tag Add:(UIView *)addView

{
    NSMutableArray*ButtonArray=[[NSMutableArray alloc]init];
    for(int i=0;i<num;i++)
    {
        UILabel*button=[[UILabel alloc] init];
        if(x&&y&&w&&h)
        {
            if(isX)
            {
                button.frame=CGRectMake(x+i*(w+padding), y, w, h);
            }
            else
            {
                button.frame=CGRectMake(x,y+i*(h+padding), w, h);
            }
        }
        if(title)
            button.text=title[i];
        if(font)
            button.font=[UIFont systemFontOfSize:font];
        if(titleColor)
            button.textColor=titleColor;
        if(addView)
            [addView addSubview:button];
        button.tag=tag++;
        NSLog(@"*Fly Labels Tag:%ld",button.tag);
        [ButtonArray addObject:button];
    }
    return ButtonArray;
}







@end
