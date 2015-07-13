//
//  FlyVLCCreatePlayer.m
//  FLY_VLC_Class
//
//  Created by Fly on 15/7/10.
//  Copyright (c) 2015年 Fly. All rights reserved.
//
//注：Fly李飞翔版权所有
//
#import "FlyVLCCreatePlayer.h"
#import "VLCMediaPlayer.h"
#import "FLYcreate.h"
#define RGBColorAlpha(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define SIZE     [UIScreen mainScreen].bounds.size

@interface FlyVLCCreatePlayer ()
{
    dispatch_queue_t q;
    UISlider*slider;
    UIView*playView;
    VLCMediaPlayer*vlcPlay;
    UILabel*time;
    UILabel*remainingTime;
    NSTimer*timer1;
    UIView*ToolBar;
    UIView*ToolBarTop;
    UIButton*play;
    UIButton*pause;
    UIButton*max;
    UIButton*min;
    UILabel*FlyName;
    BOOL ret;
    CGFloat X;
    CGFloat Y;
    CGFloat W;
    CGFloat H;
    id sfName;
    UIViewController *nvcName;
}
@end

@implementation FlyVLCCreatePlayer
-(void)createValueX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h  selfName:(id)sf
{
    X=x;
    Y=y;
    W=w;
    H=h;
    sfName=sf;
    nvcName=(UIViewController*)sfName;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopa) name:@"stop" object:nil];
}
-(void)stopa
{
    [vlcPlay stop];
}
-(void)createGCD
{
    q=dispatch_queue_create("Fly", DISPATCH_QUEUE_SERIAL);
}
-(UIView*)createPlayerX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h PlayPath:(NSString*)playPath PlayPathIsWebsite:(BOOL)IsWebsite AddView:(UIView*)addView
{
    playView=[FLYcreate flyViewX:x Y:y W:w H:h Color:[UIColor blackColor] Add:addView];
    vlcPlay=[[VLCMediaPlayer alloc]init];
    vlcPlay.drawable=playView;
    if(IsWebsite)
    {
        vlcPlay.media=[VLCMedia mediaWithURL:[NSURL URLWithString:playPath]];
    }
    else
    {
        vlcPlay.media=[VLCMedia mediaWithPath:playPath];
    }
    return playView;
}
-(void)createToolBarTopBarColor:(UIColor*)topColor BottomBarColor:(UIColor*)bottomColor AddView:(UIView*)addView
{
    ToolBar=[FLYcreate flyViewX:CGRectGetMinX(playView.frame) Y:CGRectGetMaxY(playView.frame)-30 W:playView.frame.size.width H:30 Color:bottomColor Add:addView];
    ToolBarTop=[FLYcreate flyViewX:CGRectGetMinX(playView.frame) Y:CGRectGetMinY(playView.frame) W:playView.frame.size.width H:30 Color:topColor Add:addView];
}
-(void)cateteUITap
{
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapClick:)];
    [playView addGestureRecognizer:tap];
}
-(void)TapClick:(UITapGestureRecognizer*)tap
{
    [UIView animateWithDuration:0.4 animations:^{
        ToolBar.hidden=!ToolBar.hidden;
        ToolBarTop.hidden=!ToolBarTop.hidden;
    }];
}
-(void)createUISliderImageName:(NSString*)sliderImageName LeftSliderColor:(UIColor*)LeftSliderColor RightSliderColor:(UIColor*)RightSliderColor PlayButtonImageName:(NSString*)playImageName PauseButtonImageName:(NSString*)pauseImageName MaxImageName:(NSString*)MaxImageName MinImageName:(NSString*)MinImageName
{
    slider=[[UISlider alloc]initWithFrame:CGRectMake(40, 5, ToolBar.frame.size.width-80, 25)];
    slider.minimumValue=0;
    slider.maximumValue=1;
    slider.continuous=YES;
    if(sliderImageName)
    {
        [slider setThumbImage:[UIImage imageNamed:sliderImageName] forState:UIControlStateNormal];
    }
    else
    {
        [slider setThumbImage:[UIImage imageNamed:@"player_bluebutton_down@2x"] forState:UIControlStateNormal];
    }
    slider.maximumTrackTintColor=RightSliderColor;
    slider.minimumTrackTintColor=LeftSliderColor;
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    
    [slider addTarget:self action:@selector(xx) forControlEvents:UIControlEventTouchUpInside];
    [slider addTarget:self action:@selector(anxia) forControlEvents:UIControlEventTouchDown];
    [ToolBar addSubview:slider];
    if(playImageName)
    {
        play=[FLYcreate flyButtonX:5 Y:1 W:30 H:30 Title:nil TitleFont:0 TitleColor:nil BackgroundColor:nil ImageName:playImageName bgImageName:nil Target:self action:@selector(buttonClick:) Add:ToolBar];
    }
    else
    {
        play=[FLYcreate flyButtonX:5 Y:1 W:30 H:30 Title:nil TitleFont:0 TitleColor:nil BackgroundColor:nil ImageName:@"download_begain@2x" bgImageName:nil Target:self action:@selector(buttonClick:) Add:ToolBar];
    }
    play.tag=100;
    if(pauseImageName)
    {
        pause=[FLYcreate flyButtonX:5 Y:1 W:30 H:30 Title:nil TitleFont:0 TitleColor:nil BackgroundColor:nil ImageName:pauseImageName bgImageName:nil Target:self action:@selector(buttonClick:) Add:ToolBar];
    }
    else
    {
        pause=[FLYcreate flyButtonX:5 Y:1 W:30 H:30 Title:nil TitleFont:0 TitleColor:nil BackgroundColor:nil ImageName:@"download_pause@2x" bgImageName:nil Target:self action:@selector(buttonClick:) Add:ToolBar];
    }
    pause.tag=101;
    pause.hidden=YES;
    if(MaxImageName)
    {
        max=[FLYcreate flyButtonX:ToolBar.frame.size.width-35 Y:1 W:30 H:30 Title:nil TitleFont:0 TitleColor:nil BackgroundColor:nil ImageName:MaxImageName bgImageName:nil Target:self action:@selector(max:) Add:ToolBar];
    }
    else
    {
        max=[FLYcreate flyButtonX:ToolBar.frame.size.width-35 Y:1 W:30 H:30 Title:nil TitleFont:0 TitleColor:nil BackgroundColor:nil ImageName:@"player_full@2x" bgImageName:nil Target:self action:@selector(max:) Add:ToolBar];
    }
    max.tag=117;
    if(MinImageName)
    {
        min=[FLYcreate flyButtonX:ToolBar.frame.size.width-35 Y:1 W:30 H:30 Title:nil TitleFont:0 TitleColor:nil BackgroundColor:nil ImageName:MinImageName bgImageName:nil Target:self action:@selector(min:) Add:ToolBar];
    }
    else
    {
        min=[FLYcreate flyButtonX:ToolBar.frame.size.width-35 Y:1 W:30 H:30 Title:nil TitleFont:0 TitleColor:nil BackgroundColor:nil ImageName:@"player_small@2x" bgImageName:nil Target:self action:@selector(min:) Add:ToolBar];
    }
    min.tag=118;
    min.hidden=YES;
    self.view.backgroundColor=[UIColor whiteColor];
    time=[FLYcreate flyLabelX:10 Y:10 W:80 H:15 Text:nil textColor:[UIColor whiteColor] font:11 Add:ToolBarTop];
    remainingTime=[FLYcreate flyLabelX:ToolBarTop.frame.size.width-60  Y:10 W:60 H:15 Text:nil textColor:[UIColor whiteColor] font:11 Add:ToolBarTop];
    FlyName=[FLYcreate flyLabelX:ToolBarTop.frame.size.width/2-30 Y:5 W:60 H:20 Text:@"Fly作品" textColor:nil font:13 Add:ToolBarTop];
}
-(void)xx{
    [timer1 setFireDate:[NSDate distantPast]];
}
-(void)anxia
{
    [timer1 setFireDate:[NSDate distantFuture]];
}
-(void)sliderAction:(UISlider*)slider
{
    [vlcPlay setPosition:slider.value];
}
-(void)buttonClick:(UIButton*)button
{
    if(button.tag==100)
    {
        [vlcPlay play];
        UIButton*button1=(UIButton*)[ToolBar viewWithTag:101];
        button1.hidden=NO;
        button.hidden=YES;
    }
    else if (button.tag==101)
    {
        UIButton*button1=(UIButton*)[ToolBar viewWithTag:100];
        button1.hidden=NO;
        button.hidden=YES;
        [vlcPlay pause];
    }
    else if (button.tag==102)
    {
        [vlcPlay stop];
    }
}
-(void)max:(UIButton*)button
{
        UIButton*button1=(UIButton*)[ToolBar viewWithTag:118];
        button1.hidden=NO;
        button.hidden=YES;
        [UIView animateWithDuration:0.5 animations:^{
            ret=!ret;
            nvcName.navigationController.navigationBarHidden=ret;
            playView.transform=CGAffineTransformMakeRotation(M_PI_2);
            playView.frame=[UIScreen mainScreen].bounds;
            ToolBar.transform=CGAffineTransformMakeRotation(M_PI_2);
            ToolBar.frame=CGRectMake(0, 0, 40,SIZE.height);
            ToolBarTop.transform=CGAffineTransformMakeRotation(M_PI_2);
            ToolBarTop.frame=CGRectMake(SIZE.width-40, 0, 40,SIZE.height);
            slider.frame=CGRectMake(45, 5, SIZE.height-80, 25);
            min.frame=CGRectMake(SIZE.height-45, 1, 40, 40);
            max.frame=CGRectMake(SIZE.height-45, 1, 40, 40);
            remainingTime.frame=CGRectMake(SIZE.height-60, 5, 60, 15);
            FlyName.frame=CGRectMake(SIZE.height/2-30, 5, 60, 20);
            play.frame=CGRectMake(1, 0, 40, 40);
            pause.frame=CGRectMake(1, 0, 40, 40);
            
        }];
}
-(void)min:(UIButton*)button
{
        UIButton*button1=(UIButton*)[ToolBar viewWithTag:117];
        button1.hidden=NO;
        button.hidden=YES;
        [UIView animateWithDuration:0.5 animations:^{
            ret=!ret;
            nvcName.navigationController.navigationBarHidden=ret;
            playView.transform=CGAffineTransformMakeRotation(0);
            playView.frame=CGRectMake(X, Y,W,H);
            ToolBar.transform=CGAffineTransformMakeRotation(0);
            ToolBar.frame=CGRectMake(CGRectGetMinX(playView.frame),CGRectGetMaxY(playView.frame)-30,playView.frame.size.width,30);
            ToolBarTop.transform=CGAffineTransformMakeRotation(0);
            ToolBarTop.frame=CGRectMake(CGRectGetMinX(playView.frame),CGRectGetMinY(playView.frame),playView.frame.size.width,30);
            slider.frame=CGRectMake(40, 5, ToolBar.frame.size.width-80, 25);
            remainingTime.frame=CGRectMake(ToolBarTop.frame.size.width-60, 5, 60, 15);
            max.frame=CGRectMake(ToolBar.frame.size.width-35, 1, 30, 30);
            min.frame=CGRectMake(ToolBar.frame.size.width-35, 1, 30, 30);
            FlyName.frame=CGRectMake(ToolBarTop.frame.size.width/2-30, 5, 60, 20);
            play.frame=CGRectMake(5, 1, 30, 30);
            pause.frame=CGRectMake(5, 1, 30, 30);
        }];
}
-(BOOL)prefersStatusBarHidden
{
    NSLog(@"111111");
    return ret;
}
-(void)createTimer
{
    timer1=[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(ChangeVilue) userInfo:nil repeats:YES];
}
-(void)ChangeVilue
{
    if(slider.value<vlcPlay.position)
    {
        slider.value=vlcPlay.position;
    }
    if([vlcPlay isPlaying])
    {
        float r=arc4random()%255;
        float g=arc4random()%255;
        float b=arc4random()%255;
        FlyName.textColor=[UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:1];
        time.text=[NSString  stringWithFormat:@"%@",[vlcPlay time]];
        remainingTime.text=[NSString stringWithFormat:@"%@",[vlcPlay remainingTime]];
    }
}
+(UIView*)FlyCreatePlayerX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h TopBarColor:(UIColor*)topColor BottomBarColor:(UIColor*)bottomColor PlayButtonImageName:(NSString*)playImageName PauseButtonImageName:(NSString*)pauseImageName SliderImageName:(NSString*)sliderImageName LeftSliderColor:(UIColor*)LeftSliderColor RightSliderColor:(UIColor*)RightSliderColor MaxImageName:(NSString*)MaxImageName MinImageName:(NSString*)MinImageName PlayPath:(NSString*)playPath PlayPathIsWebsite:(BOOL)IsWebsite AddView:(UIView*)addView selfName:(id)sf
{
    FlyVLCCreatePlayer*fly=[[FlyVLCCreatePlayer alloc]init];
    [fly createGCD];
    UIView*FlyView=[fly createPlayerX:x Y:y W:w H:h PlayPath:playPath PlayPathIsWebsite:IsWebsite AddView:addView];
    [fly createValueX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h  selfName:(id)sf];
    [fly createToolBarTopBarColor:topColor BottomBarColor:bottomColor AddView:addView];
    [fly cateteUITap];
    [fly createUISliderImageName:sliderImageName LeftSliderColor:LeftSliderColor RightSliderColor:RightSliderColor PlayButtonImageName:playImageName PauseButtonImageName:pauseImageName MaxImageName:MaxImageName MinImageName:MinImageName];
    [fly createTimer];
    return FlyView;
}
@end
