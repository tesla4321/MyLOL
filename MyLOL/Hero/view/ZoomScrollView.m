//
//  ZoomScrollView.m
//  Photoes
//
//  Created by neal on 14-7-19.
//  Copyright (c) 2014年 www.lanou3g.com. All rights reserved.
//

#import "ZoomScrollView.h"

@interface ZoomScrollView()


@end

@implementation ZoomScrollView


//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        //设置默认值  最大比例3  最小比例0.5
//        //外界可以自己改这个值
//        self.maximumZoomScale = 3;
//        self.minimumZoomScale = 0.5;
//        self.delegate = self;
//        // Initialization code
//    }
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.maximumZoomScale = 3;
        self.minimumZoomScale = 1;
        self.delegate = self;
        _imageView = [[UIImageView alloc] initWithFrame:(CGRectMake(0, self.bounds.size.height/3, self.bounds.size.width, self.bounds.size.height/3))];

        [self addSubview:_imageView];
    }
    return self;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _imageView;
}


- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    if (scrollView.zoomScale > 1) {
        _imageView.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
