//
//  FangDaiViewController.h
//  FangDaiDemo
//
//  Created by baiteng-5 on 14-1-6.
//  Copyright (c) 2014年 org.baiteng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OANavigationBar.h"
#import "AppData.h"
#import "XYPieChart.h"
#import <QuartzCore/QuartzCore.h>

@interface FangDaiViewController : UIViewController<UITextFieldDelegate,UIGestureRecognizerDelegate,UITableViewDataSource,UITableViewDelegate,XYPieChartDelegate, XYPieChartDataSource>{
    
    UITextField *rateText;
    IBOutlet UIButton *benxiBtn;
    IBOutlet UIButton *benjinBtn;
    IBOutlet UIView *jisuanView;
    IBOutlet UIView *ShuiJisuanView;
    
    XYPieChart *pieChartLeft;
    UILabel *pieLabel;
    XYPieChart *pieChartLeft2;
    UILabel *pieLabel2;
    NSMutableArray *slices;
    NSMutableArray *sliceColors;
    
    IBOutlet UILabel *huankuanLabel;
    IBOutlet UILabel *zongjiaL;
    IBOutlet UILabel *shoufuL;
    IBOutlet UILabel *daikuanzongL;
    IBOutlet UILabel *lixiL;
    IBOutlet UILabel *huankuanzongL;
    IBOutlet UILabel *lilvL;
    IBOutlet UILabel *shouyueL;
    IBOutlet UIButton *upBtn;
    IBOutlet UIButton *upBtn2;

    IBOutlet UILabel *leftLabel1;
    IBOutlet UILabel *leftLabel2;
    IBOutlet UILabel *leftLabel3;
    IBOutlet UILabel *zongjiaLabel;
    IBOutlet UILabel *shoufuLabel;
    
    UIView *shuifeiView;
    UIView *newShuiView;
    UIView *erShuiView;
    UIButton *newBtn;
    UIButton *erBtn;
    UIButton *weiyiBtn1;
    UIButton *weiyiBtn2;
    UITextField *newMianjiText;
    UITextField *newDanText;
    UILabel *newputongL;
    UITextField *erMianjiText;
    UITextField *erDanText;
    UILabel *erputongL;
    UILabel *erNianL;
    UIButton *erleftBtn1;
    UIButton *erleftBtn2;
    UIButton *erleftBtn3;
    IBOutlet UILabel *zongjiaLs;
    IBOutlet UILabel *gongzhengLs;
    IBOutlet UILabel *chanquanLs;
    IBOutlet UILabel *maimaiLs;
    IBOutlet UILabel *qishuiLs;
    IBOutlet UILabel *yinhuaLs;
    IBOutlet UILabel *zongshuiLs;
    IBOutlet UILabel *zongshuiLs2;
    IBOutlet UILabel *left11;
    IBOutlet UILabel *left22;
    IBOutlet UILabel *left33;
    IBOutlet UILabel *left44;
    IBOutlet UILabel *left55;
    IBOutlet UILabel *left66;
    
    IBOutlet UILabel *shuiLeftL1;
    IBOutlet UILabel *shuiLeftL2;
    IBOutlet UILabel *shuiLeftL3;
    IBOutlet UILabel *shuiLeftL4;
    IBOutlet UILabel *shuiLeftL5;
    IBOutlet UILabel *shuiLeftL6;
    IBOutlet UILabel *shuiLeftL7;
    IBOutlet UILabel *shuiLeftL8;
}

@property (nonatomic, retain) OANavigationBar * fangDaiBar;
@property (nonatomic,copy) NSString *danPrice;
@property (nonatomic,copy) NSString *housesize;

@end
