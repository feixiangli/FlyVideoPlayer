# FlyVideoPlayer
一句话定制属于自己的万能播放器
***************************************************************

*Fly李飞翔作品-*-李飞翔版权所有*

***************************************************************
***本库为自定义播放器
***实现了一句话定制自己的播放器

（1.）可定制的控件：
1》视频的位置 大小 
2》暂停开始按钮的图标
3》进度条图标，进度颜色
4》全屏和返回的图标
5》上下操作栏的背景颜色
*（imageNmae为nil会显示默认图标）

（2.）实现功能：
1》万能播放
2》网络视频
3》本地视频

********************************************************************
环境配置：
1.c++混编
**本库基于VLC定制
1》自备VLC库并且添加进你的工程
修改：Build Sttings->C++ Standard Library 改为GNU

2.Vlc需要的库
AudioToolbox
OpenGLES
CFNetwork
CoreText
QuartzCore
Security
libbz2
libiconv

3.使用方法：

1> 加入 FlyVLCCreatePlayer.h 头文件
2> 类方法一句话调用。
+(UIView*)FlyCreatePlayerX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h TopBarColor:(UIColor*)topColor BottomBarColor:(UIColor*)bottomColor PlayButtonImageName:(NSString*)playImageName PauseButtonImageName:(NSString*)pauseImageName SliderImageName:(NSString*)sliderImageName LeftSliderColor:(UIColor*)LeftSliderColor RightSliderColor:(UIColor*)RightSliderColor MaxImageName:(NSString*)MaxImageName MinImageName:(NSString*)MinImageName PlayPath:(NSString*)playPath PlayPathIsWebsite:(BOOL)IsWebsite AddView:(UIView*)addView selfName:(id)sf;


1.1版本更新

**增加了终止视频方法
**使用时 调用此通知
[[NSNotificationCenter defaultCenter]postNotificationName:@"stop" object:nil];

**在需要播放的页面添加此方法以达到播放时隐藏状态栏
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
**在返回的页面添加，以达到返回时状态栏显示
-(BOOL)prefersStatusBarHidden
{
    return NO;
}


*************************

最后更新日期 2015年 7月13日  版本号 1.1

***********************************
