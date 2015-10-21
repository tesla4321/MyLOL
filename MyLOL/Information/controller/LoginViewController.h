//
//  LoginViewController.h
//  MyLOL
//
//  Created by kayle on 15/10/21.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "BaseViewController.h"
#import "ServerModel.h"
@interface LoginViewController : BaseViewController

@property(nonatomic,strong)UITextField *playerField;
@property(nonatomic,strong)UITextField *serverField;

@property(nonatomic,strong)UIPickerView *pickerView;


@property(nonatomic,strong)UIButton *logInBtn;


@property(nonatomic,strong)UILabel *playerLabel;
@property(nonatomic,strong)UILabel *serverLabel;



@property(nonatomic,strong)NSArray *serverArray;





@end
