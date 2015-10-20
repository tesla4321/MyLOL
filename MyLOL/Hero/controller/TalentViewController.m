//
//  TalentViewController.m
//  MyLOL
//
//  Created by kayle on 15/10/17.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "TalentViewController.h"
#import "UIImageView+WebCache.h"
static BOOL down = 0;
@interface TalentViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIAlertView *alert;


@end

@implementation TalentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.topView.image = [UIImage imageNamed:@"huise.jpg"];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:(CGRectMake(0, self.view.bounds.size.height/6, self.view.bounds.size.width, self.view.bounds.size.height * 2/3))];

    _scrollView.contentSize = CGSizeMake(2 * self.view.bounds.size.width, self.view.bounds.size.height * 2/3);
    _scrollView.pagingEnabled = 1;
    _scrollView.bounces = 1;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = 0;
    _scrollView.minimumZoomScale = 1;
    _scrollView.maximumZoomScale = 3;
    
    
    
    
    _runeImage = [[ZoomScrollView alloc]initWithFrame:_scrollView.bounds];
    _runeImage.userInteractionEnabled = 1;

    _talentImage = [[ZoomScrollView alloc]initWithFrame:CGRectMake(_scrollView.bounds.size.width, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height)];
    _talentImage.userInteractionEnabled = 1;
    
    [_scrollView addSubview:_runeImage];
    [_scrollView addSubview:_talentImage];
    [self.view addSubview:_scrollView];
    
    _descriptionLaebl = [[UILabel alloc]initWithFrame:(CGRectMake(0, self.view.bounds.size.height * 5 /6, self.view.bounds.size.width, self.view.bounds.size.height /9))];
    _descriptionLaebl.textColor = [UIColor whiteColor];
    _descriptionLaebl.font = [UIFont systemFontOfSize:13];
    _descriptionLaebl.numberOfLines = 0;
    _descriptionLaebl.text = _runeDes;
    [self.view addSubview:_descriptionLaebl];
    
    _downloadBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    _downloadBtn.frame = CGRectMake(10, self.view.bounds.size.height * 17/18, 30,30);
    [_downloadBtn setBackgroundImage:[UIImage imageNamed:@"download"] forState:(UIControlStateNormal)];
    [_downloadBtn addTarget:self action:@selector(download:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_downloadBtn];
    
    [_runeImage.imageView sd_setImageWithURL:[NSURL URLWithString:_fwModel.fuPic] placeholderImage:[UIImage imageNamed:@"1"]];
    [_talentImage.imageView sd_setImageWithURL:[NSURL URLWithString:_fwModel.tianPic] placeholderImage:[UIImage imageNamed:@"1"]];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tap];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
//    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchAction:)];
//    [_talentImage addGestureRecognizer:pinch];
//    [_runeImage addGestureRecognizer:pinch];
}

//- (void)pinchAction:(UIPinchGestureRecognizer *)recognizer{
//    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
//    recognizer.scale = 1;
//
//}


- (void)tapAction:(UITapGestureRecognizer *)recognizer{
    static BOOL count = 0;
    if (count == 0) {
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.backBtn.hidden = 1;
            CGRect rec = self.descriptionLaebl.frame;
            rec.origin.y  = self.descriptionLaebl.frame.origin.y + self.view.bounds.size.height/6;
            self.descriptionLaebl.frame = rec;
            CGRect rec1 = self.downloadBtn.frame;
            rec1.origin.y  = self.downloadBtn.frame.origin.y + self.view.bounds.size.height/6;
            self.downloadBtn.frame = rec1;
            count = 1;
        }];
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            
            self.backBtn.hidden = 0;

            _descriptionLaebl.frame = (CGRectMake(0, self.view.bounds.size.height * 5 /6, self.view.bounds.size.width, self.view.bounds.size.height /9));
            _downloadBtn.frame = CGRectMake(10, self.view.bounds.size.height * 17/18, 30,30);;
            count = 0;
        }];
    }
    
}



//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
//    CGPoint offset = scrollView.contentOffset;
//    if (offset.x >= scrollView.bounds.size.width/2) {
//        return _talentImage;
//    }else{
//        return _runeImage;
//    }
//    
//}


- (void)setFwModel:(FWTFmodel *)fwModel{
    _fwModel = fwModel;
    
    _runePic = _fwModel.fuPic;
    _talentPic = _fwModel.tianPic;
    _runeDes = _fwModel.fuDes;
    _talentDes = _fwModel.tianDes;

    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;

    if (offset.x >= scrollView.bounds.size.width/2) {
        _descriptionLaebl.text = _talentDes;
        down = 1;
    }else{
        _descriptionLaebl.text = _runeDes;
        down = 0;
    }
    
    if (offset.x/scrollView.bounds.size.width >= 1) {
        _runeImage.zoomScale = 1;

    }
    if (offset.x/scrollView.bounds.size.width <= 0) {
        _talentImage.zoomScale = 1;

    }
 
    
    
    
}

- (void)download:(UIButton *)button{
    if (down == 0) {
        UIImageWriteToSavedPhotosAlbum(_runeImage.imageView.image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
    }else{
        UIImageWriteToSavedPhotosAlbum(_talentImage.imageView.image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
    }
    
}

- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSString *message = @"保存失败";
    if (!error) {
        message = @"成功保存到相册";
    }else
    {
        message = [error description];
    }
    _alert = [[UIAlertView alloc]initWithTitle:nil message:@"保存成功" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(dissmissAlert) userInfo:nil repeats:0];
    [_alert show];
    
}

- (void)dissmissAlert{
    [_alert dismissWithClickedButtonIndex:0 animated:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
