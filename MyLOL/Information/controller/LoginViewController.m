//
//  LoginViewController.m
//  MyLOL
//
//  Created by kayle on 15/10/21.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "LoginViewController.h"
#import "WebViewViewController.h"
@interface LoginViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat height = self.bottomView.bounds.size.height;
    
    _playerLabel = [[UILabel alloc]initWithFrame:(CGRectMake(KScreenWidth/6, height/5, 90, 30 ))];
    _playerLabel.text = @"召唤师名字";
    _playerLabel.textColor = [UIColor whiteColor];
    _serverLabel = [[UILabel alloc]initWithFrame:(CGRectMake(KScreenWidth/6, height * 2/5, 90, 30))];
    _serverLabel.text = @"选择大区";
    _serverLabel.textColor = [UIColor whiteColor];
    _playerField = [[UITextField alloc]initWithFrame:(CGRectMake(KScreenWidth/6 + 70 + 30, height/5, KScreenWidth * 5/6 - 120 - 30, 30))];
    _playerField.backgroundColor = [UIColor whiteColor];
    _playerField.borderStyle = UITextBorderStyleRoundedRect;
    _serverField = [[UITextField alloc]initWithFrame:(CGRectMake(KScreenWidth/6 + 70 + 30, height * 2/5, KScreenWidth * 5/6 - 120 - 30, 30))];
    _serverField.delegate = self;
    _serverField.backgroundColor = [UIColor whiteColor];
    _serverField.borderStyle = UITextBorderStyleRoundedRect;
    _pickerView = [[UIPickerView alloc]initWithFrame:(CGRectMake(0, height * 3/4, KScreenWidth, height/4))];
    
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    
    
    _serverField.inputView = _pickerView;
//    _serverField.enabled = 0;
    
    _logInBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    _logInBtn.frame = CGRectMake(KScreenWidth/2 - 30, height * 2/5 + 80, 60, 30);
    [_logInBtn setTitle:@"登录" forState:(UIControlStateNormal)];
    _logInBtn.backgroundColor = [UIColor orangeColor];
    _logInBtn.layer.cornerRadius = 8;
    [_logInBtn addTarget:self action:@selector(loginAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.bottomView addSubview:_logInBtn];
    
    
    [self.bottomView addSubview:_playerLabel];
    [self.bottomView addSubview:_playerField];
    [self.bottomView addSubview:_serverField];
    [self.bottomView addSubview:_serverLabel];

    
    
    
    // Do any additional setup after loading the view.
}

- (void)loginAction:(UIButton *)button{
    
    if (_playerField.text.length == 0||_serverField.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"警告" message:@"填写不完整" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }else{
        WebViewViewController *webVC = [[WebViewViewController alloc]init];
        webVC.server = [_serverArray[[_pickerView selectedRowInComponent:0]] sn];
        webVC.name = _playerField.text;
        [self.navigationController pushViewController:webVC animated:1];
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    textField.text = @"艾欧尼亚";
    return 1;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSInteger lineNumber = [pickerView selectedRowInComponent:0];
    _serverField.text = [_serverArray[lineNumber] fn];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:1];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _serverArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_serverArray[row] fn];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
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
