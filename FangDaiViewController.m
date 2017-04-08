//
//  FangDaiViewController.m
//  FangDaiDemo
//
//  Created by baiteng-5 on 14-1-6.
//  Copyright (c) 2014年 org.baiteng. All rights reserved.
//

#import "FangDaiViewController.h"
#import "FangResultViewController.h"
#import "CONST.h"



@interface FangDaiViewController ()

@property (nonatomic, retain) UIScrollView * userContentView;
@property (nonatomic, retain) UIButton * shangDaiBtn;//商贷按钮
@property (nonatomic, retain) UIButton * gongBtn;//公积金贷款按钮
@property (nonatomic, retain) UIButton * zuHeBtn;//组合型贷款按钮
@property (nonatomic, retain) UIButton * shuifeiBtn;//税费计算按钮

@property (nonatomic, retain) UIView * shangDaiView;//商贷背景视图
@property (nonatomic, retain) UIView * sonShangView_one;//商贷子视图一
@property (nonatomic, retain) UIView * sonShangView_two;//商贷子视图二
@property (nonatomic, retain) UIView * gongView;//公积金背景视图
@property (nonatomic, retain) UIView * sonGongView_one;//公积金贷款子视图一
@property (nonatomic, retain) UIView * sonGongView_two;//公积金贷款子视图二
@property (nonatomic, retain) UIView * sonGongView;//公积金贷款子视图
@property (nonatomic, retain) UIView * zuHeView;//组合背景视图
@property (nonatomic, retain) UIView * sonZuView;//组合贷款子视图

@property (nonatomic, retain) UIView * shuiView;//税费计算背景视图
@property (nonatomic, retain) UIView * shuiNewView;//税费计算新房背景视图
@property (nonatomic, retain) UIView * shuiSecondView;//税费计算二手房背景视图

@property (nonatomic, retain) UIButton * oneBtn;//等额本息
@property (nonatomic, retain) UIButton * twoBtn;//等额本金

@property (nonatomic, retain) NSString * jiSuanType;//算法类型
@property (nonatomic, retain) NSString * huanKuanType;//还款类型
@property (nonatomic, retain) NSString * suanType;//房价计算类型

@property (nonatomic, retain) UIButton * shangDanBtn;//商贷按单价计价按钮
@property (nonatomic, retain) UIButton * shangZongBtn;//商贷按总价计价按钮
@property (nonatomic, retain) UIButton * gongDanBtn;//公积金按单价计价按钮
@property (nonatomic, retain) UIButton * gongZongBtn;//公积金按总价计价按钮

@property (nonatomic, retain) UIButton * shangDanBtn2;//商贷按单价计价按钮
@property (nonatomic, retain) UIButton * shangZongBtn2;//商贷按总价计价按钮
@property (nonatomic, retain) UIButton * gongDanBtn2;//公积金按单价计价按钮
@property (nonatomic, retain) UIButton * gongZongBtn2;//公积金按总价计价按钮


#pragma mark ---------商贷页面数据----------
/*
 *  按单价计算商贷所需要的数据框
 */
@property (nonatomic, retain) UITextField * shangJiaGe;//商贷单价
@property (nonatomic, retain) UITextField * shangMianJi;//商贷面积
@property (nonatomic, retain) UILabel * shangDanCheng;//商贷按揭成数
@property (nonatomic, retain) UILabel * shangDanNian;//商贷年数
@property (nonatomic, retain) UILabel * shangDanLiLv;//商贷利率
/*
 *  按总价计算商贷所需要的数据框
 */
@property (nonatomic, retain) UITextField * shangZong;//商贷总额
@property (nonatomic, retain) UILabel * shangZongNian;//商贷总价按揭年数
@property (nonatomic, retain) UILabel * shangZongLiLv;//商贷总价利率

#pragma mark ---------公积金页面数据---------
/*
 *  按单价计算公积金所需要的数据框
 */
@property (nonatomic, retain) UITextField * gongJiaGe;//公积金单价
@property (nonatomic, retain) UITextField * gongMianJi;//公积金面积
@property (nonatomic, retain) UILabel * gongDanCheng;//公积金按揭成数
@property (nonatomic, retain) UILabel * gongDanNian;//公积金年数
@property (nonatomic, retain) UILabel * gongDanLiLv;//公积金利率
/*
 *  按总价计算公积金所需要的数据框
 */
@property (nonatomic, retain) UITextField * gongZong;//公积金总额
@property (nonatomic, retain) UILabel * gongZongNian;//公积金总价按揭年数
@property (nonatomic, retain) UILabel * gongZongLiLv;//公积金总价利率

#pragma mark ---------组合贷款页面数据---------
/*
 *  组合型贷款分类输入数据框
 */
@property (nonatomic, retain) UITextField * gongDai;//公积金贷款
@property (nonatomic, retain) UITextField * shangDai;//商业贷款
@property (nonatomic, retain) UILabel * zuHeNian;//组合贷款按揭年数
@property (nonatomic, retain) UILabel * zuHeLiLv;//组合贷款利率

//数组
@property (nonatomic, retain) NSMutableArray * array_1;//成数数组
@property (nonatomic, retain) NSMutableArray * array_2;//年数数组
@property (nonatomic, retain) NSMutableArray * array_3;//按揭利率年份
@property (nonatomic, retain) NSMutableArray * array_4;//商贷利率
@property (nonatomic, retain) NSMutableArray * array_5;//公积金贷款利率
@property (nonatomic, retain) NSMutableArray * array_6;//贷款年数
@property (nonatomic, retain) NSMutableArray * array_7;//住宅
@property (nonatomic, retain) NSMutableArray * array_8;//产证年限
//弹出视图层
@property (nonatomic, retain) UIView * coverView;//黑色半透明遮盖层
@property (nonatomic, retain) UIImageView * popIMgview;//弹出列表背景
@property (nonatomic, retain) UITableView * popTableView;//弹出列表
@property (nonatomic, retain) UILabel * popLabel;//弹出视图标题
@property (nonatomic, retain) NSMutableArray * tabArray;//列表数组
@property (nonatomic, retain) NSString * popType;//弹出视图标识
@property (nonatomic, retain) NSString * xianString;//显示数据

//显示利率
@property (nonatomic, retain) UILabel * label_1;
@property (nonatomic, retain) UILabel * label_2;
@property (nonatomic, retain) UILabel * label_3;
@property (nonatomic, retain) UILabel * label_4;
@property (nonatomic, retain) UILabel * label_5;
@property (nonatomic, retain) UILabel * label_6;

@property (nonatomic, retain) UILabel *feilabel;

@end

@implementation FangDaiViewController
@synthesize userContentView,feilabel;
@synthesize fangDaiBar;
@synthesize shangDaiBtn,gongBtn,zuHeBtn,shuifeiBtn;
@synthesize shangDaiView,gongView,zuHeView,shuiNewView,shuiSecondView,shuiView, sonShangView_one,sonShangView_two,sonGongView,sonZuView,sonGongView_one,sonGongView_two;
@synthesize jiSuanType,huanKuanType,suanType;
@synthesize oneBtn,twoBtn;
@synthesize shangDanBtn,shangZongBtn,gongDanBtn,gongZongBtn,shangDanBtn2,shangZongBtn2,gongDanBtn2,gongZongBtn2;

@synthesize shangJiaGe,shangMianJi,shangZong;
@synthesize gongJiaGe,gongMianJi,gongZong;
@synthesize gongDai,shangDai;
@synthesize shangDanCheng,shangDanNian,shangDanLiLv,shangZongNian,shangZongLiLv;
@synthesize gongDanCheng,gongDanNian,gongDanLiLv,gongZongNian,gongZongLiLv;
@synthesize zuHeNian,zuHeLiLv;
@synthesize array_1,array_2,array_3,array_4,array_5,array_6,array_7,array_8;
@synthesize coverView,popIMgview,popTableView,popLabel;
@synthesize tabArray,popType,xianString;
@synthesize label_1,label_2,label_3,label_4,label_5,label_6;
@synthesize danPrice,housesize;
-(void)dealloc
{
//    [userContentView removeFromSuperview];
//    [userContentView release];
//    
//    [fangDaiBar release];
//    
//    [shangDaiView removeFromSuperview];
//    [shangDaiView release];
//    
//    [gongView removeFromSuperview];
//    [gongView release];
//    
//    [zuHeView removeFromSuperview];
//    [zuHeView release];
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)creatDataArray
{
    //按揭成数数组
    
//    self.array_3 = [NSArray arrayWithObjects:@"12年7月6日利率下限(7折)",@"12年7月6日利率下限(85折)",@"12年7月6日利率上限(1.1倍)",@"12年7月6日基准利率",@"12年6月8日利率上限(1.1倍)",@"12年6月8日利率下限(85折)",@"12年6月8日基准利率",@"11年7月6日利率上限(1.1倍)",@"11年7月6日利率下限(85折)",@"11年7月6日基准利率",@"11年4月5日利率上限(1.1倍)",@"11年4月5日利率下限(85折)",@"11年4月5日利率下限(7折)",@"11年4月5日基准利率",@"11年2月9日利率上限(1.1倍)",@"11年2月9日利率下限(85折)",@"11年2月9日利率下限(7折)",@"11年2月9日基准利率",@"10年12月26日利率上限(1.1倍)",@"10年12月26日利率下限(85折)",@"10年12月26日利率下限(7折)",@"10年12月26日基准利率",@"10年10月20日利率上限(1.1倍)",@"10年10月20日基准利率",@"10年10月20日利率下限(85折)",@"10年10月20日利率下限(7折)",@"08年12月23日利率上限(1.1倍)",@"08年12月23日基准利率",@"08年12月23日利率下限(85折)",@"08年12月23日利率下限(7折)", nil];
    
//    self.array_4 = [NSArray arrayWithObjects:@"4.59%", @"5.57%", @"7.21%", @"6.55%", @"7.48%",
//                    @"5.78%", @"6.8%", @"7.75%", @"5.99%", @"7.05%", @"7.48%", @"5.78%",
//                    @"4.76%", @"6.8%", @"7.26%", @"5.61%", @"4.62%", @"6.6%", @"7.04%",
//                    @"5.44%", @"4.48%", @"6.4%", @"6.75%", @"6.14%", @"5.22%", @"4.3%",
//                    @"6.53%", @"5.94%", @"5.05%", @"4.16%",nil];
//    self.array_5 = [NSArray arrayWithObjects:@"4.5%", @"4.5%", @"4.5%", @"4.5%", @"4.7%",
//                    @"4.7%", @"4.7%", @"4.9%", @"4.9%", @"4.9%", @"4.7%", @"4.7%", @"4.7%",
//                    @"4.7%", @"4.5%", @"4.5%", @"4.5%", @"4.5%", @"4.3%", @"4.3%", @"4.3%",
//                    @"4.3%", @"4.05%", @"4.05%", @"4.05%", @"4.05%", @"3.87%", @"3.87%",
//                    @"3.87%", @"3.87%", nil];
    
    array_3 = [[NSMutableArray alloc] initWithObjects:@"基准利率",@"7折",@"8.5折",@"1.1",nil];
    
    NSString* shangdaiRate=@"4.35, 4.75, 4.75, 4.90";
    NSString* gongjiRate=@"2.75, 2.75, 2.75, 3.25";
    array_4=[[NSMutableArray alloc]initWithArray: [BaseViewController getArrayFrom: shangdaiRate mark:@","]];
    array_5=[[NSMutableArray alloc]initWithArray: [BaseViewController getArrayFrom: gongjiRate mark:@","]];
    
    array_6 = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"25",@"30", nil];
    array_7 = [[NSMutableArray alloc] initWithObjects:@"普通住宅",@"非普通住宅",@"经济适用房",nil];
    array_8 = [[NSMutableArray alloc] initWithObjects:@"不满两年",@"满两年不满五年",@"满五年",nil];
    array_1 = [[NSMutableArray alloc] initWithObjects:@"2成",@"3成",@"4成",@"5成",@"6成",@"7成",@"8成",@"9成", nil];
    array_2 = [[NSMutableArray alloc] initWithObjects:@"1年(12期)",@"2年(24期)",@"3年(36期)",@"4年(48期)",@"5年(60期)",@"6年(72期)",@"7年(84期)",@"8年(96期)",@"9年(108期)",@"10年(120期)",@"11年(134期)",@"12年(144期)",@"13年(156期)",@"14年(168期)",@"15年(180期)",@"16年(192期)",@"17年(204期)",@"18年(216期)",@"19年(228期)",@"20年(240期)",@"25年(300期)",@"30年(360期)", nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title=@"房贷计算器";
    
    NSString *nibName=self.nibName;
    [gAppData().statTracker pageviewStartWithName:nibName];
    
    self.navigationController.navigationBarHidden = NO;
    
    rateText=[[UITextField alloc]initWithFrame:CGRectMake(0, 4, 0, 0)];
    benjinBtn.layer.masksToBounds=YES;
    benjinBtn.layer.cornerRadius=5;
    benxiBtn.layer.masksToBounds=YES;
    benxiBtn.layer.cornerRadius=5;
    huanKuanType = @"等额本息";
    
    //创建数组
    [self creatDataArray];
    
    userContentView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, SCREEN_HEIGHT)];
    userContentView.contentSize = CGSizeMake(SCREEN_WIDTH, 530);
    userContentView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:userContentView];
    [userContentView release];
    
    leftLabel1.layer.cornerRadius=5;
    leftLabel1.layer.masksToBounds=YES;
    leftLabel2.layer.cornerRadius=5;
    leftLabel2.layer.masksToBounds=YES;
    leftLabel3.layer.cornerRadius=5;
    leftLabel3.layer.masksToBounds=YES;
    
    left11.layer.cornerRadius=5;
    left11.layer.masksToBounds=YES;
    left22.layer.cornerRadius=5;
    left22.layer.masksToBounds=YES;
    left33.layer.cornerRadius=5;
    left33.layer.masksToBounds=YES;
    left44.layer.cornerRadius=5;
    left44.layer.masksToBounds=YES;
    left55.layer.cornerRadius=5;
    left55.layer.masksToBounds=YES;
    left66.layer.cornerRadius=5;
    left66.layer.masksToBounds=YES;
    upBtn.transform = CGAffineTransformMakeRotation(1.57);
    upBtn2.transform = CGAffineTransformMakeRotation(1.57);
    
    
    
    [self addPicChart];
    [self addPicChartShui];
    
    //商业贷款
    [self addShangyeView];
    //公积金贷款
    [self addGongjiView];
    //组合型贷款
    [self addZuheView];
    //税费计算
    [self addShuiFeiView];

    //添加类型按钮
      //商贷
    
    shangDaiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shangDaiBtn.frame = CGRectMake(0, 15, SCREEN_WIDTH/4, 47);
    [shangDaiBtn addTarget:self action:@selector(shangAction:) forControlEvents:UIControlEventTouchUpInside];
    [shangDaiBtn setTitle:@"商业贷" forState:UIControlStateNormal];
    [shangDaiBtn setTitleColor:UIColorFromRGB(0x666666) forState:UIControlStateNormal];
    [shangDaiBtn setBackgroundColor:[UIColor whiteColor]];
    //商贷按钮默认选中
    shangDaiBtn.selected = YES;
    [self shangAction:shangDaiBtn];
      //公积金
    gongBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    gongBtn.frame = CGRectMake(1*SCREEN_WIDTH/4, 15, SCREEN_WIDTH/4, 47);
    [gongBtn addTarget:self action:@selector(gongAction:) forControlEvents:UIControlEventTouchUpInside];
    [gongBtn setTitle:@"公积金贷" forState:UIControlStateNormal];
    [gongBtn setTitleColor:UIColorFromRGB(0x666666) forState:UIControlStateNormal];
    [gongBtn setBackgroundColor:[UIColor whiteColor]];
    
      //组合
    zuHeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    zuHeBtn.frame = CGRectMake(2*SCREEN_WIDTH/4, 15, SCREEN_WIDTH/4, 47);
    [zuHeBtn addTarget:self action:@selector(zuHeAction:) forControlEvents:UIControlEventTouchUpInside];
    [zuHeBtn setTitle:@"组合贷" forState:UIControlStateNormal];
    [zuHeBtn setTitleColor:UIColorFromRGB(0x666666) forState:UIControlStateNormal];
    [zuHeBtn setBackgroundColor:[UIColor whiteColor]];

    //税费计算
    shuifeiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shuifeiBtn.frame = CGRectMake(3*SCREEN_WIDTH/4, 15, SCREEN_WIDTH/4, 47);
    [shuifeiBtn addTarget:self action:@selector(shuifeiAction:) forControlEvents:UIControlEventTouchUpInside];
    [shuifeiBtn setTitle:@"税费计算" forState:UIControlStateNormal];
    [shuifeiBtn setTitleColor:UIColorFromRGB(0x666666) forState:UIControlStateNormal];
    [shuifeiBtn setBackgroundColor:[UIColor whiteColor]];
    
    [userContentView addSubview:shangDaiBtn];
    [userContentView addSubview:gongBtn];
    [userContentView addSubview:zuHeBtn];
    [userContentView addSubview:shuifeiBtn];
    [userContentView addSubview:jisuanView];
    [userContentView addSubview:ShuiJisuanView];
    ShuiJisuanView.hidden=YES;
    
    UILabel *henglabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 62, SCREEN_WIDTH, 10)];
    henglabel.backgroundColor=LIGHT_BACK_COLOR;
    [userContentView addSubview:henglabel];
    
    feilabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 57, SCREEN_WIDTH/4, 5)];
    feilabel.backgroundColor=AliRedColor;
    [userContentView addSubview:feilabel];
    
    /*还款方式注释掉
    //添加还款类型页面
    UIImageView * topImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 62, SCREEN_WIDTH-20, 59)];
    topImgView.image = [UIImage imageNamed:@"top_01.png"];
    topImgView.userInteractionEnabled = YES;
    [userContentView addSubview:topImgView];
    [topImgView release];
    //视图添加手势
    UITapGestureRecognizer *singleFingerOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoad)];
    singleFingerOne.numberOfTouchesRequired = 1; //手指数
    singleFingerOne.numberOfTapsRequired = 1; //tap次数
    singleFingerOne.delegate = self;
    [topImgView addGestureRecognizer:singleFingerOne];
    //添加还款类型选择按钮
       //按钮一
    oneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    oneBtn.frame = CGRectMake((SCREEN_WIDTH-20)/3+10, 5, 20, 20);
    [oneBtn setImage:[UIImage imageNamed:@"圆未选.png"] forState:UIControlStateNormal];
    [oneBtn setImage:[UIImage imageNamed:@"圆选中.png"] forState:UIControlStateSelected];
    [oneBtn addTarget:self action:@selector(oneBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [topImgView addSubview:oneBtn];
    oneBtn.selected = YES;
    [self oneBtnAction:oneBtn];
       //按钮二
    twoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    twoBtn.frame = CGRectMake(2*(SCREEN_WIDTH-20)/3+10, 5, 20, 20);
    [twoBtn setImage:[UIImage imageNamed:@"圆未选.png"] forState:UIControlStateNormal];
    [twoBtn setImage:[UIImage imageNamed:@"圆选中.png"] forState:UIControlStateSelected];
    [twoBtn addTarget:self action:@selector(twoBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [topImgView addSubview:twoBtn];
    
    还款方式注释掉 */
    
    //添加弹出视图层
    [self creatPopView];
}

-(void)addPicChart{
    slices = [[NSMutableArray alloc]initWithObjects:[NSNumber numberWithInt: 50],[NSNumber numberWithInt: 24],[NSNumber numberWithInt: 26], nil];
    //饼图
    pieChartLeft=[[XYPieChart alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-90, 110, 180, 180)];
    [pieChartLeft setDataSource:self];
    [pieChartLeft setDelegate:self];
    [pieChartLeft setStartPieAngle:M_PI_2];
    [pieChartLeft setAnimationSpeed:1.5];
    [pieChartLeft setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:0]];
    [pieChartLeft setLabelRadius:40];
    [pieChartLeft setShowPercentage:NO];
    [pieChartLeft setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [pieChartLeft setUserInteractionEnabled:NO];
    [jisuanView addSubview:pieChartLeft];
    
    UIImageView *whiteImage=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-40, 105+55, 80, 80)];
    whiteImage.backgroundColor=[UIColor whiteColor];
    whiteImage.layer.masksToBounds=YES;
    whiteImage.layer.cornerRadius=40;
    [jisuanView addSubview:whiteImage];
    
    UILabel *pieLabel1=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, 175, 100, 22)];
    pieLabel1.textColor=DEEP_TEXT_COLOR;
    pieLabel1.textAlignment=1;
    pieLabel1.text=@"月供";
    pieLabel1.font=[UIFont systemFontOfSize:15];
    [jisuanView addSubview:pieLabel1];
    
    pieLabel=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, 195, 100, 22)];
    pieLabel.textColor=AliRedColor;
    pieLabel.textAlignment=1;
    pieLabel.text=@"¥:10000";
    pieLabel.font=[UIFont systemFontOfSize:15];
    [jisuanView addSubview:pieLabel];
    
    sliceColors =[NSArray arrayWithObjects:
                  [UIColor colorWithRed:0/255.0 green:199/255.0 blue:217/255.0 alpha:1],
                  [UIColor colorWithRed:246/255.0 green:155/255.0 blue:40/255.0 alpha:1],
                  [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],nil];
    
    [pieChartLeft reloadData];
}

-(void)addPicChartShui{
    slices = [[NSMutableArray alloc]initWithObjects:[NSNumber numberWithInt: 50],[NSNumber numberWithInt: 24],[NSNumber numberWithInt: 26], nil];
    //饼图
    pieChartLeft2=[[XYPieChart alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-90, 60, 180, 180)];
    [pieChartLeft2 setDataSource:self];
    [pieChartLeft2 setDelegate:self];
    [pieChartLeft2 setStartPieAngle:M_PI_2];
    [pieChartLeft2 setAnimationSpeed:1.5];
    [pieChartLeft2 setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:0]];
    [pieChartLeft2 setLabelRadius:40];
    [pieChartLeft2 setShowPercentage:NO];
    [pieChartLeft2 setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [pieChartLeft2 setUserInteractionEnabled:NO];
    [ShuiJisuanView addSubview:pieChartLeft2];
    
    UIImageView *whiteImage=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-40, 105+5, 80, 80)];
    whiteImage.backgroundColor=[UIColor whiteColor];
    whiteImage.layer.masksToBounds=YES;
    whiteImage.layer.cornerRadius=40;
    [ShuiJisuanView addSubview:whiteImage];
    
    UILabel *pieLabel1=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, 125, 100, 22)];
    pieLabel1.textColor=DEEP_TEXT_COLOR;
    pieLabel1.textAlignment=1;
    pieLabel1.text=@"参考税金";
    pieLabel1.font=[UIFont systemFontOfSize:15];
    [ShuiJisuanView addSubview:pieLabel1];
    
    pieLabel2=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, 145, 100, 22)];
    pieLabel2.textColor=AliRedColor;
    pieLabel2.textAlignment=1;
    pieLabel2.text=@"¥:10000";
    pieLabel2.font=[UIFont systemFontOfSize:15];
    [ShuiJisuanView addSubview:pieLabel2];
    
    sliceColors =[NSArray arrayWithObjects:
                  [UIColor colorWithRed:0/255.0 green:199/255.0 blue:217/255.0 alpha:1],
                  [UIColor colorWithRed:246/255.0 green:155/255.0 blue:40/255.0 alpha:1],
                  [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],nil];
    
    [pieChartLeft2 reloadData];
}
//添加弹出视图层
-(void)creatPopView
{
    //列表所需数组
    tabArray = [[NSMutableArray alloc]initWithCapacity:0];
    //背景层
    coverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    coverView.hidden = YES;
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0.3;
    [self.view addSubview:coverView];
    [coverView release];
    //显示视图
    popIMgview = [[UIImageView alloc]initWithFrame:CGRectMake(-5, 130, SCREEN_WIDTH+10, 288)];
    popIMgview.hidden = YES;
    popIMgview.backgroundColor=[UIColor whiteColor];
    //popIMgview.center = self.view.center;
    popIMgview.userInteractionEnabled = YES;
    //popIMgview.image = [UIImage imageNamed:@"appear_03.png"];
    [self.view addSubview:popIMgview];
    [popIMgview release];
    //添加列表
    popTableView = [[UITableView alloc] initWithFrame:CGRectMake(7, 40, SCREEN_WIDTH-22, 200) style:UITableViewStylePlain];
    popTableView.delegate = self;
    popTableView.dataSource = self;
    popTableView.tableFooterView = [[[UIView alloc] init] autorelease];
    [popIMgview addSubview:popTableView];
    //标题栏
    popLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, 240, 30)];
    popLabel.backgroundColor = [UIColor clearColor];
    [popIMgview addSubview:popLabel];
    [popLabel release];
    
    UILabel* hengLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, 0.7)];
    hengLabel1.backgroundColor = LIGHT2_BACK_COLOR;
    [popIMgview addSubview:hengLabel1];
    [hengLabel1 release];
    
    UILabel* hengLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 240, SCREEN_WIDTH, 0.7)];
    hengLabel2.backgroundColor = LIGHT2_BACK_COLOR;
    [popIMgview addSubview:hengLabel2];
    [hengLabel2 release];
    
    UILabel* shuLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, 240, 1, 48)];
    shuLabel2.backgroundColor = LIGHT2_BACK_COLOR;
    [popIMgview addSubview:shuLabel2];
    [shuLabel2 release];
    //按钮
    //控制按钮
    UIButton * quxiaoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    quxiaoBtn.frame = CGRectMake(5, 240, (SCREEN_WIDTH-10)/2, 43);
    [quxiaoBtn setTitle:@"取消" forState:UIControlStateNormal];
    [quxiaoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [quxiaoBtn addTarget:self action:@selector(fsalAction:) forControlEvents:UIControlEventTouchUpInside];
    [popIMgview addSubview:quxiaoBtn];
    
    UIButton * quedingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    quedingBtn.frame = CGRectMake((SCREEN_WIDTH-10)/2, 240, (SCREEN_WIDTH-10)/2, 43);
    [quedingBtn setTitle:@"确认" forState:UIControlStateNormal];
    [quedingBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [quedingBtn addTarget:self action:@selector(sureAction:) forControlEvents:UIControlEventTouchUpInside];
    [popIMgview addSubview:quedingBtn];
}

#pragma mark -------Tab Dele-------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([popType rangeOfString:@"利率"].location!=NSNotFound){
        if(tabArray.count>0)
        return tabArray.count+1;
    }
    return tabArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellWithIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
    }
    cell.selectedBackgroundView = [[[UIView alloc]initWithFrame:cell.frame]autorelease];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.selectionStyle=UITableViewCellSelectionStyleGray;
    
    if ([popType rangeOfString:@"利率"].location!=NSNotFound){
        if(indexPath.row==self.tabArray.count){
            cell.textLabel.text = @"自定义利率";
            
            [rateText removeFromSuperview];
            //rateText=[[UITextField alloc]initWithFrame:CGRectMake(120, 4, 180, 30)];
            rateText.frame=CGRectMake(120, 4, 180, 30);
            rateText.placeholder=@"输入自定义利率";
            rateText.font=[UIFont systemFontOfSize:16];
            rateText.keyboardType=UIKeyboardTypeDecimalPad;
            rateText.delegate=self;
            [cell.contentView addSubview:rateText];
        }else{
            cell.textLabel.text = self.tabArray[indexPath.row];
        }
        return cell;
    }
    [rateText removeFromSuperview];
    
    cell.textLabel.text = self.tabArray[indexPath.row];

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([popType rangeOfString:@"利率"].location!=NSNotFound){
        if(indexPath.row==self.tabArray.count){
            if(rateText.text.length>0){
                xianString=[rateText.text copy];
            }
        }
        else{
            xianString = [tabArray objectAtIndex:indexPath.row];
        }
        return;
    }
    xianString = [tabArray objectAtIndex:indexPath.row];
}

//- (void)textFieldEditChanged:(UITextField *)textField
//{
//    NSLog(@"textField text : %@", [textField text]);
//    xianString=[textField text];
//}
//
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
//    return YES;
//}
//
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    
//    return YES;
//}
- (void)dismissAlertView:(UIAlertView*)alertView{
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
}

//取消和确定按钮
-(void)fsalAction:(UIButton *)btn
{
    popIMgview.hidden = YES;
    coverView.hidden = YES;
}
-(void)sureAction:(UIButton *)btn
{
    if(xianString.length==0){
        popIMgview.hidden = YES;
        coverView.hidden = YES;
        return;
    }
    
    //避免自定义利率不刷新
    if([popType rangeOfString:@"利率"].location!=NSNotFound){
        int index=[array_3 indexOfObject:xianString];
        if(index==-1){
            float a=[xianString floatValue];
            if(a>2){
                UIAlertView *loginAlert = [[UIAlertView alloc] initWithTitle:@"自定义利率不能大于2倍" message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
                [loginAlert show];
                [self performSelector:@selector(dismissAlertView:) withObject:loginAlert afterDelay:1.0f];
                return;
            }
        }
    }
    popIMgview.hidden = YES;
    coverView.hidden = YES;
    if ([popType isEqualToString:@"商贷按揭成数"]) {
        if (xianString.length>0) {
            shangDanCheng.text = xianString;
        }
    }
    if ([popType isEqualToString:@"商贷按揭年数"]) {
        if (xianString.length>0) {
            shangDanNian.text = xianString;
            
            [self reloadLabel1];
        }
   
    }
    if ([popType isEqualToString:@"商贷按揭利率"]) {
        if (xianString.length>0) {
            shangDanLiLv.text = xianString;
            
            [self reloadLabel1];
        }
    }
    if ([popType isEqualToString:@"商贷总价按揭年数"]) {
        if (xianString.length>0) {
            shangZongNian.text = xianString;
        }
         [self reloadLabel2];
    }
    if ([popType isEqualToString:@"商贷总价按揭利率"]) {
        if (xianString.length>0) {
            shangZongLiLv.text = xianString;
        }
        [self reloadLabel2];
    }
    if ([popType isEqualToString:@"公积金按揭成数"]) {
        if (xianString.length>0) {
            gongDanCheng.text = xianString;
        }
    }
    if ([popType isEqualToString:@"公积金按揭年数"]) {
        if (xianString.length>0) {
            gongDanNian.text = xianString;
            [self reloadLabel3];
        }
    }
    if ([popType isEqualToString:@"公积金按揭利率"]) {
        if (xianString.length>0) {
            gongDanLiLv.text = xianString;
            [self reloadLabel3];
            
        }
    }
    if ([popType isEqualToString:@"公积金总价按揭年数"]) {
        if (xianString.length>0) {
            gongZongNian.text = xianString;
            [self reloadLabel4];
        }
    }
    if ([popType isEqualToString:@"公积金总价按揭利率"]) {
        if (xianString.length>0) {
            gongZongLiLv.text = xianString;
            [self reloadLabel4];
            
        }
    }
    if ([popType isEqualToString:@"组合型按揭年数"]) {
        if (xianString.length>0) {
            zuHeNian.text = xianString;
            [self reloadLabel5];
        }
    }
    if ([popType isEqualToString:@"组合型按揭利率"]) {
        if (xianString.length>0) {
            zuHeLiLv.text = xianString;
            [self reloadLabel5];
        }
    }
    
    if ([popType isEqualToString:@"住宅类型"]) {
        if (xianString.length>0) {
            newputongL.text = xianString;
            erputongL.text=xianString;
        }
    }
    
    if ([popType isEqualToString:@"房产证年限"]) {
        if (xianString.length>0) {
            erNianL.text = xianString;
        }
    }
}
#pragma mark ----------根据期数和利率算实际利率，刷新利率显示---------
-(void)reloadLabel1{
    //以下是根据选择的按揭年数和按揭利率算出的实际利率
    NSString *nianStr=shangDanNian.text;
    int a=[array_2 indexOfObject:nianStr];
    NSString *lilvStr=shangDanLiLv.text;
    int b=[array_3 indexOfObject:lilvStr];
    float rate=0;
    if(b==0){
        rate=1;
    }
    if(b==1){
        rate=0.7;
    }
    if(b==2){
        rate=0.8;
    }
    if(b==3){
        rate=1.1;
    }
    if(b==-1){
        rate=[xianString floatValue];
    }
    
    if(a==0){
        float lilv=[[array_4 objectAtIndex:0]floatValue];
        label_1.text =[NSString stringWithFormat:@"%.1f",lilv *rate];
    }
    if(a==1||a==2){
        float lilv=[[array_4 objectAtIndex:1]floatValue];
        label_1.text =[NSString stringWithFormat:@"%.1f",lilv *rate];
    }
    if(a==3||a==4){
        float lilv=[[array_4 objectAtIndex:2]floatValue];
        label_1.text =[NSString stringWithFormat:@"%.1f",lilv *rate];
    }
    if(a>4){
        float lilv=[[array_4 objectAtIndex:3]floatValue];
        label_1.text =[NSString stringWithFormat:@"%.1f",lilv *rate];
    }
    //以上是根据选择的按揭年数和按揭利率算出的实际利率
}

-(void)reloadLabel2{
    //以下是根据选择的按揭年数和按揭利率算出的实际利率
    NSString *nianStr=shangZongNian.text;
    int a=[array_2 indexOfObject:nianStr];
    NSString *lilvStr=shangZongLiLv.text;
    int b=[array_3 indexOfObject:lilvStr];
    float rate=0;
    if(b==0){
        rate=1;
    }
    if(b==1){
        rate=0.7;
    }
    if(b==2){
        rate=0.8;
    }
    if(b==3){
        rate=1.1;
    }
    if(b==-1){
        rate=[xianString floatValue];
    }
    
    if(a==0){
        float lilv=[[array_4 objectAtIndex:0]floatValue];
        label_2.text =[NSString stringWithFormat:@"%.1f",lilv *rate];
    }
    if(a==1||a==2){
        float lilv=[[array_4 objectAtIndex:1]floatValue];
        label_2.text =[NSString stringWithFormat:@"%.1f",lilv *rate];
    }
    if(a==3||a==4){
        float lilv=[[array_4 objectAtIndex:2]floatValue];
        label_2.text =[NSString stringWithFormat:@"%.1f",lilv *rate];
    }
    if(a>4){
        float lilv=[[array_4 objectAtIndex:3]floatValue];
        label_2.text =[NSString stringWithFormat:@"%.1f",lilv *rate];
    }
    //以上是根据选择的按揭年数和按揭利率算出的实际利率
}

-(void)reloadLabel3{
    //以下是根据选择的按揭年数和按揭利率算出的实际利率
    NSString *nianStr=gongDanNian.text;
    int a=[array_2 indexOfObject:nianStr];
    NSString *lilvStr=gongDanLiLv.text;
    int b=[array_3 indexOfObject:lilvStr];
    float rate=0;
    if(b==0){
        rate=1;
    }
    if(b==1){
        rate=0.7;
    }
    if(b==2){
        rate=0.8;
    }
    if(b==3){
        rate=1.1;
    }
    if(b==-1){
        rate=[xianString floatValue];
    }
    
    if(a==0){
        float lilv=[[array_5 objectAtIndex:0]floatValue];
        label_3.text =[NSString stringWithFormat:@"%.1f",lilv *rate];
    }
    if(a==1||a==2){
        float lilv=[[array_5 objectAtIndex:1]floatValue];
        label_3.text =[NSString stringWithFormat:@"%.1f",lilv *rate];
    }
    if(a==3){
        float lilv=[[array_5 objectAtIndex:2]floatValue];
        label_3.text =[NSString stringWithFormat:@"%.1f",lilv *rate];
    }
    if(a>3){
        float lilv=[[array_5 objectAtIndex:3]floatValue];
        label_3.text =[NSString stringWithFormat:@"%.1f",lilv *rate];
    }
    //以上是根据选择的按揭年数和按揭利率算出的实际利率
}

-(void)reloadLabel4{
    //以下是根据选择的按揭年数和按揭利率算出的实际利率
    NSString *nianStr=gongZongNian.text;
    int a=[array_2 indexOfObject:nianStr];
    NSString *lilvStr=gongZongLiLv.text;
    int b=[array_3 indexOfObject:lilvStr];
    float rate=0;
    if(b==0){
        rate=1;
    }
    if(b==1){
        rate=0.7;
    }
    if(b==2){
        rate=0.8;
    }
    if(b==3){
        rate=1.1;
    }
    if(b==-1){
        rate=[xianString floatValue];
    }
    
    if(a==0){
        float lilv=[[array_5 objectAtIndex:0]floatValue];
        label_4.text =[NSString stringWithFormat:@"%.1f",lilv *rate];
    }
    if(a==1||a==2){
        float lilv=[[array_5 objectAtIndex:1]floatValue];
        label_4.text =[NSString stringWithFormat:@"%.1f",lilv *rate];
    }
    if(a==3){
        float lilv=[[array_5 objectAtIndex:2]floatValue];
        label_4.text =[NSString stringWithFormat:@"%.1f",lilv *rate];
    }
    if(a>3){
        float lilv=[[array_5 objectAtIndex:3]floatValue];
        label_4.text =[NSString stringWithFormat:@"%.1f",lilv *rate];
    }
    //以上是根据选择的按揭年数和按揭利率算出的实际利率
}

-(void)reloadLabel5{
    //以下是根据选择的按揭年数和按揭利率算出的实际利率
    NSString *nianStr=zuHeNian.text;
    int a=[array_2 indexOfObject:nianStr];
    NSString *lilvStr=zuHeLiLv.text;
    int b=[array_3 indexOfObject:lilvStr];
    float rate=0;
    if(b==0){
        rate=1;
    }
    if(b==1){
        rate=0.7;
    }
    if(b==2){
        rate=0.8;
    }
    if(b==3){
        rate=1.1;
    }
    if(b==-1){
        rate=[xianString floatValue];
    }
    
    //商贷利率
    if(a==0){
        float lilv=[[array_4 objectAtIndex:0]floatValue];
        label_6.text =[NSString stringWithFormat:@"商业贷款利率 %.1f",lilv *rate];
    }
    if(a==1||a==2){
        float lilv=[[array_4 objectAtIndex:1]floatValue];
        label_6.text =[NSString stringWithFormat:@"商业贷款利率 %.1f",lilv *rate];
    }
    if(a==3||a==4){
        float lilv=[[array_4 objectAtIndex:2]floatValue];
        label_6.text =[NSString stringWithFormat:@"商业贷款利率 %.1f",lilv *rate];
    }
    if(a>4){
        float lilv=[[array_4 objectAtIndex:3]floatValue];
        label_6.text =[NSString stringWithFormat:@"商业贷款利率 %.1f",lilv *rate];
    }
    
    //公积金利率
    if(a==0){
        float lilv=[[array_5 objectAtIndex:0]floatValue];
        label_5.text =[NSString stringWithFormat:@"公积金贷款利率 %.1f",lilv *rate];
    }
    if(a==1||a==2){
        float lilv=[[array_5 objectAtIndex:1]floatValue];
        label_5.text =[NSString stringWithFormat:@"公积金贷款利率 %.1f",lilv *rate];
    }
    if(a==3){
        float lilv=[[array_5 objectAtIndex:2]floatValue];
        label_5.text =[NSString stringWithFormat:@"公积金贷款利率 %.1f",lilv *rate];
    }
    if(a>3){
        float lilv=[[array_5 objectAtIndex:3]floatValue];
        label_5.text =[NSString stringWithFormat:@"公积金贷款利率 %.1f",lilv *rate];
    }
    //以上是根据选择的按揭年数和按揭利率算出的实际利率
}


#pragma mark ----------添加商业贷款视图----------
//商业贷款
-(void)addShangyeView
{
    shangDaiView = [[UIView alloc]init];
    shangDaiView.hidden = YES;
    shangDaiView.frame = CGRectMake(10, 70, SCREEN_WIDTH-20, 500);
    shangDaiView.backgroundColor = [UIColor clearColor];
    
    //添加房款计价方式
    UILabel *label11=[[UILabel alloc]initWithFrame:CGRectMake(20, 12, 100, 20)];
    label11.text=@"计算方式";
    label11.textColor=DEEP_TEXT_COLOR;
    label11.font=[UIFont systemFontOfSize:17];
    [shangDaiView addSubview:label11];
    [label11 release];
 
    //添加计价方式按钮
       //按照单价
    shangDanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shangDanBtn.frame = CGRectMake((SCREEN_WIDTH-20)/3+5, 12, 20, 20);
    [shangDanBtn setImage:[UIImage imageNamed:@"圆未选.png"] forState:UIControlStateNormal];
    [shangDanBtn setImage:[UIImage imageNamed:@"圆选中.png"] forState:UIControlStateSelected];
    [shangDanBtn addTarget:self action:@selector(danBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [shangDaiView addSubview:shangDanBtn];
       //按照总价
    shangZongBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shangZongBtn.frame = CGRectMake(2*(SCREEN_WIDTH-20)/3+5, 12, 20, 20);
    [shangZongBtn setImage:[UIImage imageNamed:@"圆未选.png"] forState:UIControlStateNormal];
    [shangZongBtn setImage:[UIImage imageNamed:@"圆选中.png"] forState:UIControlStateSelected];
    [shangZongBtn addTarget:self action:@selector(zongBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [shangDaiView addSubview:shangZongBtn];
    [userContentView addSubview:shangDaiView];
    
    shangDanBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    shangDanBtn2.frame = CGRectMake((SCREEN_WIDTH-20)/3+5, 5, 80, 30);
    [shangDanBtn2 addTarget:self action:@selector(danBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [shangDaiView addSubview:shangDanBtn2];
    //按照总价
    shangZongBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    shangZongBtn2.frame = CGRectMake(2*(SCREEN_WIDTH-20)/3+5, 5, 80, 30);
    [shangZongBtn2 addTarget:self action:@selector(zongBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [shangDaiView addSubview:shangZongBtn2];
    [userContentView addSubview:shangDaiView];
    
    UILabel *label12=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-20)/3+30, 12, 100, 20)];
    label12.text=@"按单价";
    label12.textColor=DEEP_TEXT_COLOR;
    label12.font=[UIFont systemFontOfSize:17];
    [shangDaiView addSubview:label12];
    [label12 release];
    
    UILabel *label13=[[UILabel alloc]initWithFrame:CGRectMake(2*(SCREEN_WIDTH-20)/3+30, 12, 100, 20)];
    label13.text=@"按总额";
    label13.textColor=DEEP_TEXT_COLOR;
    label13.font=[UIFont systemFontOfSize:17];
    [shangDaiView addSubview:label13];
    [label13 release];
    
    [shangDaiView release];
    
    //单价计算详细页面
    sonShangView_one = [[UIView alloc]initWithFrame:CGRectMake(0, 45, SCREEN_WIDTH, 368)];
    sonShangView_one.backgroundColor = [UIColor clearColor];
    sonShangView_one.hidden = YES;
    [shangDaiView addSubview:sonShangView_one];
    [sonShangView_one release];
    UIImageView * oneImgView_shang = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-20, 268)];
    oneImgView_shang.userInteractionEnabled = YES;
    [sonShangView_one addSubview:oneImgView_shang];
    [oneImgView_shang release];
    
    //视图添加手势
    UITapGestureRecognizer *singleFingerOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoad)];
    singleFingerOne.numberOfTouchesRequired = 1; //手指数
    singleFingerOne.numberOfTapsRequired = 1; //tap次数
    singleFingerOne.delegate = self;
    [oneImgView_shang addGestureRecognizer:singleFingerOne];
    
    //添加按钮
    UIButton * shangOneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shangOneBtn.frame = CGRectMake(20, 280, SCREEN_WIDTH-60, 45);
    [shangOneBtn setTitle:@"开始计算" forState:UIControlStateNormal];
    [shangOneBtn setBackgroundColor:[UIColor colorWithRed:252/255.0 green:102/255.0 blue:40/255.0 alpha:100]];
    shangOneBtn.layer.masksToBounds=YES;
    shangOneBtn.layer.cornerRadius=5;
    [shangOneBtn addTarget:self action:@selector(jiSuanAction:) forControlEvents:UIControlEventTouchUpInside];
    [sonShangView_one addSubview:shangOneBtn];
    //添加输入部分信息
        //单价部分

    UILabel *label21=[[UILabel alloc]initWithFrame:CGRectMake(20, 12, 100, 20)];
    label21.text=@"单价";
    label21.textColor=DEEP_TEXT_COLOR;
    label21.font=[UIFont systemFontOfSize:17];
    [sonShangView_one addSubview:label21];
    [label21 release];
    
    UILabel *label22=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-70, 12, 100, 20)];
    label22.text=@"元/平米";
    label22.textColor=DEEP_TEXT_COLOR;
    label22.font=[UIFont systemFontOfSize:17];
    [sonShangView_one addSubview:label22];
    [label22 release];
    
    shangJiaGe = [[UITextField alloc]initWithFrame:CGRectMake(80, 7, SCREEN_WIDTH-150, 30)];
    shangJiaGe.borderStyle = UITextBorderStyleNone;
    shangJiaGe.backgroundColor = [UIColor clearColor];
    shangJiaGe.keyboardType = UIKeyboardTypeDecimalPad;
    shangJiaGe.autocapitalizationType = UITextAutocapitalizationTypeNone;
    shangJiaGe.font = [UIFont systemFontOfSize:15];
    shangJiaGe.textAlignment = NSTextAlignmentCenter;
    [shangJiaGe setUserInteractionEnabled:YES];
    shangJiaGe.clearButtonMode = UITextFieldViewModeWhileEditing;
    if(danPrice.length>0){
        shangJiaGe.text=danPrice;
    }
    [sonShangView_one addSubview:shangJiaGe];
    [shangJiaGe release];
    
    UILabel *label31=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45, 100, 20)];
    label31.text=@"面积";
    label31.textColor=DEEP_TEXT_COLOR;
    label31.font=[UIFont systemFontOfSize:17];
    [sonShangView_one addSubview:label31];
    [label31 release];
    
    UILabel *label32=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-70, 12+45, 100, 20)];
    label32.text=@"平米";
    label32.textColor=DEEP_TEXT_COLOR;
    label32.font=[UIFont systemFontOfSize:17];
    [sonShangView_one addSubview:label32];
    [label32 release];

        //面积部分
    shangMianJi = [[UITextField alloc]initWithFrame:CGRectMake(80, 52, SCREEN_WIDTH-150, 30)];
    shangMianJi.borderStyle = UITextBorderStyleNone;
    shangMianJi.backgroundColor = [UIColor clearColor];
    shangMianJi.keyboardType = UIKeyboardTypeDecimalPad;
    shangMianJi.autocapitalizationType = UITextAutocapitalizationTypeNone;
    shangMianJi.font = [UIFont systemFontOfSize:15];
    shangMianJi.textAlignment = NSTextAlignmentCenter;
    [shangMianJi setUserInteractionEnabled:YES];
    shangMianJi.clearButtonMode = UITextFieldViewModeWhileEditing;
    if(housesize.length>0){
        shangMianJi.text=housesize;
    }
    [sonShangView_one addSubview:shangMianJi];
    [shangMianJi release];
    
       //按揭成数
    UILabel *label41=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45*2, 100, 20)];
    label41.text=@"首付成数";
    label41.textColor=DEEP_TEXT_COLOR;
    label41.font=[UIFont systemFontOfSize:17];
    [sonShangView_one addSubview:label41];
    [label41 release];
    
    UIButton * btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    btnOne.frame = CGRectMake(110, 97, SCREEN_WIDTH-120, 30);
    btnOne.tag = 1;
    //[btnOne setImage:[UIImage imageNamed:@"selectlabel.png"] forState:UIControlStateNormal];
    [btnOne addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    [sonShangView_one addSubview:btnOne];
    
    UIImageView *downImage=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-52, 12+45*2,20, 20)];
    downImage.image=[UIImage imageNamed:@"down_arrow.png"];
    [sonShangView_one addSubview:downImage];
    
    shangDanCheng = [[UILabel alloc]initWithFrame:CGRectMake(2, 3, 135, 24)];
    shangDanCheng.textAlignment = NSTextAlignmentCenter;
    shangDanCheng.backgroundColor = [UIColor clearColor];
    if(array_1.count==0||array_1==nil){
        return;
    }
    if(array_2.count==0||array_2==nil){
        return;
    }
    if(array_3.count==0||array_3==nil){
        return;
    }
    shangDanCheng.text = [array_1 objectAtIndex:1];
    shangDanCheng.font = [UIFont systemFontOfSize:16];
    [btnOne addSubview:shangDanCheng];
    [shangDanCheng release];
       //按揭年数
    UILabel *label51=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45*3, 100, 20)];
    label51.text=@"按揭年数";
    label51.textColor=DEEP_TEXT_COLOR;
    label51.font=[UIFont systemFontOfSize:17];
    [sonShangView_one addSubview:label51];
    [label51 release];
    
    UIButton * btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTwo.frame = CGRectMake(110, 142, SCREEN_WIDTH-120, 30);
    btnTwo.tag = 2;
    //[btnTwo setImage:[UIImage imageNamed:@"selectlabel.png"] forState:UIControlStateNormal];
    [btnTwo addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    [sonShangView_one addSubview:btnTwo];
    
    UIImageView *downImage2=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-52, 12+45*3,20, 20)];
    downImage2.image=[UIImage imageNamed:@"down_arrow.png"];
    [sonShangView_one addSubview:downImage2];
    
    shangDanNian = [[UILabel alloc]initWithFrame:CGRectMake(2, 3, 135, 24)];
    shangDanNian.textAlignment = NSTextAlignmentCenter;
    shangDanNian.backgroundColor = [UIColor clearColor];
    shangDanNian.text = [array_2 objectAtIndex:19];
    shangDanNian.font = [UIFont systemFontOfSize:16];
    [btnTwo addSubview:shangDanNian];
    [shangDanNian release];
       //利率
    UILabel *label61=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45*4, 100, 20)];
    label61.text=@"利率";
    label61.textColor=DEEP_TEXT_COLOR;
    label61.font=[UIFont systemFontOfSize:17];
    [sonShangView_one addSubview:label61];
    [label61 release];
    
    UIButton * btnTre = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTre.frame = CGRectMake(110, 187, SCREEN_WIDTH-120, 30);
    btnTre.tag = 3;
    //[btnTre setImage:[UIImage imageNamed:@"selectlabel.png"] forState:UIControlStateNormal];
    [btnTre addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    [sonShangView_one addSubview:btnTre];
    UIImageView *downImage3=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-52, 12+45*4,20, 20)];
    downImage3.image=[UIImage imageNamed:@"down_arrow.png"];
    [sonShangView_one addSubview:downImage3];
    
    shangDanLiLv = [[UILabel alloc]initWithFrame:CGRectMake(2, 3, 135, 24)];
    shangDanLiLv.textAlignment = NSTextAlignmentCenter;
    shangDanLiLv.backgroundColor = [UIColor clearColor];
    shangDanLiLv.text = [array_3 objectAtIndex:0];
    shangDanLiLv.font = [UIFont systemFontOfSize:16];
    [btnTre addSubview:shangDanLiLv];
    [shangDanLiLv release];
        //显示利率
    label_1 = [[UILabel alloc]initWithFrame:CGRectMake(110, 235, 167, 25)];
    label_1.font = [UIFont systemFontOfSize:16];
    label_1.text = [array_4 objectAtIndex:0];
    label_1.textAlignment = NSTextAlignmentCenter;
    label_1.backgroundColor = [UIColor clearColor];
    [sonShangView_one addSubview:label_1];
    [label_1 release];
    
    //总价计算详细页面
    sonShangView_two = [[UIView alloc]initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 288)];
    sonShangView_two.backgroundColor = [UIColor clearColor];
    sonShangView_two.hidden = YES;
    [shangDaiView addSubview:sonShangView_two];
    [sonShangView_two release];
    UIImageView * twoImgView_shang = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 188)];
    twoImgView_shang.userInteractionEnabled = YES;
    [sonShangView_two addSubview:twoImgView_shang];
    [twoImgView_shang release];
    //视图添加手势
    UITapGestureRecognizer *singleZong = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoad)];
    singleZong.numberOfTouchesRequired = 1; //手指数
    singleZong.numberOfTapsRequired = 1; //tap次数
    singleZong.delegate = self;
    [twoImgView_shang addGestureRecognizer:singleZong];
    //贷款总额输入部分
    
    UILabel *label211=[[UILabel alloc]initWithFrame:CGRectMake(20, 12, 100, 20)];
    label211.text=@"贷款总额";
    label211.textColor=DEEP_TEXT_COLOR;
    label211.font=[UIFont systemFontOfSize:17];
    [sonShangView_two addSubview:label211];
    [label211 release];
    
    UILabel *label212=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-70, 12, 100, 20)];
    label212.text=@"万元";
    label212.textColor=DEEP_TEXT_COLOR;
    label212.font=[UIFont systemFontOfSize:17];
    [sonShangView_two addSubview:label212];
    [label212 release];
    
    UIImageView * inputImg_zong = [[UIImageView alloc]initWithFrame:CGRectMake(90, 8, SCREEN_WIDTH-160, 30)];
    inputImg_zong.userInteractionEnabled = YES;
//    inputImg_zong.image = [UIImage imageNamed:@"input.png"];
    [sonShangView_two addSubview:inputImg_zong];
    [inputImg_zong release];
    shangZong = [[UITextField alloc]initWithFrame:CGRectMake(1, 5, SCREEN_WIDTH-160, 20)];
    shangZong.borderStyle = UITextBorderStyleNone;
    shangZong.backgroundColor = [UIColor clearColor];
    shangZong.keyboardType = UIKeyboardTypeDecimalPad;
    shangZong.autocapitalizationType = UITextAutocapitalizationTypeNone;
    shangZong.font = [UIFont systemFontOfSize:15];
    shangZong.textAlignment = NSTextAlignmentCenter;
    [shangZong setUserInteractionEnabled:YES];
    shangZong.clearButtonMode = UITextFieldViewModeWhileEditing;
    [inputImg_zong addSubview:shangZong];
    [shangZong release];
       //按揭年数
    UILabel *label221=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45, 100, 20)];
    label221.text=@"按揭年数";
    label221.textColor=DEEP_TEXT_COLOR;
    label221.font=[UIFont systemFontOfSize:17];
    [sonShangView_two addSubview:label221];
    [label221 release];
    
    UIButton * btnOne_one = [UIButton buttonWithType:UIButtonTypeCustom];
    btnOne_one.frame = CGRectMake(110, 52, SCREEN_WIDTH-120, 30);
    btnOne_one.tag = 4;
    [btnOne_one addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    [sonShangView_two addSubview:btnOne_one];
    UIImageView *downImage11=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-52, 12+45,20, 20)];
    downImage11.image=[UIImage imageNamed:@"down_arrow.png"];
    [sonShangView_two addSubview:downImage11];
    
    shangZongNian = [[UILabel alloc]initWithFrame:CGRectMake(2, 3, 135, 24)];
    shangZongNian.textAlignment = NSTextAlignmentCenter;
    shangZongNian.backgroundColor = [UIColor clearColor];
    shangZongNian.text = [array_2 objectAtIndex:19];
    shangZongNian.font = [UIFont systemFontOfSize:16];
    [btnOne_one addSubview:shangZongNian];
    [shangZongNian release];
        //利率
    UILabel *label231=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45*2, 100, 20)];
    label231.text=@"利率";
    label231.textColor=DEEP_TEXT_COLOR;
    label231.font=[UIFont systemFontOfSize:17];
    [sonShangView_two addSubview:label231];
    [label231 release];
    
    UIButton * btnOne_two = [UIButton buttonWithType:UIButtonTypeCustom];
    btnOne_two.frame = CGRectMake(110, 96, SCREEN_WIDTH-120, 30);
    btnOne_two.tag = 5;
    [btnOne_two addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    [sonShangView_two addSubview:btnOne_two];
    
    UIImageView *downImage12=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-52, 12+45*2,20, 20)];
    downImage12.image=[UIImage imageNamed:@"down_arrow.png"];
    [sonShangView_two addSubview:downImage12];
    
    
    shangZongLiLv = [[UILabel alloc]initWithFrame:CGRectMake(2, 3, 135, 24)];
    shangZongLiLv.textAlignment = NSTextAlignmentCenter;
    shangZongLiLv.backgroundColor = [UIColor clearColor];
    shangZongLiLv.text = [array_3 objectAtIndex:0];
    shangZongLiLv.font = [UIFont systemFontOfSize:16];
    [btnOne_two addSubview:shangZongLiLv];
    [shangZongLiLv release];
    //显示利率
    label_2 = [[UILabel alloc]initWithFrame:CGRectMake(110, 142, 167, 25)];
    label_2.font = [UIFont systemFontOfSize:16];
    label_2.text = [array_4 objectAtIndex:0];
    label_2.textAlignment = NSTextAlignmentCenter;
    label_2.backgroundColor = [UIColor clearColor];
    [sonShangView_two addSubview:label_2];
    [label_2 release];
    
    for(int i=0;i<7;i++){
        UILabel *henglabel=[[UILabel alloc]initWithFrame:CGRectMake(0, i*45, SCREEN_WIDTH, 0.7)];
        henglabel.backgroundColor=LIGHT_BACK_COLOR;
        [sonShangView_one addSubview:henglabel];
    }
    
    for(int i=0;i<5;i++){
        UILabel *henglabel=[[UILabel alloc]initWithFrame:CGRectMake(0, i*45, SCREEN_WIDTH, 0.7)];
        henglabel.backgroundColor=LIGHT_BACK_COLOR;
        [sonShangView_two addSubview:henglabel];
    }
    
    //添加按钮
    UIButton * shangTwoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shangTwoBtn.frame = CGRectMake(20, 200, SCREEN_WIDTH-60, 45);
    [shangTwoBtn setTitle:@"开始计算" forState:UIControlStateNormal];
    [shangTwoBtn setBackgroundColor:[UIColor colorWithRed:252/255.0 green:102/255.0 blue:40/255.0 alpha:100]];
    shangTwoBtn.layer.masksToBounds=YES;
    shangTwoBtn.layer.cornerRadius=5;
    [shangTwoBtn addTarget:self action:@selector(jiSuanAction:) forControlEvents:UIControlEventTouchUpInside];
    [sonShangView_two addSubview:shangTwoBtn];
    
    jisuanView.frame=CGRectMake(0,shangTwoBtn.frame.origin.y+250,SCREEN_WIDTH,400);
    jisuanView.hidden=YES;
    
    
    //默认选中按单价计算按钮
    shangDanBtn.selected = YES;
    [self danBtnAction:shangDanBtn];
    
    [self reloadLabel1];
    [self reloadLabel2];
}
//房款计算类型
-(void)danBtnAction:(UIButton *)btn
{
    shangDanBtn.selected = YES;
    shangZongBtn.selected = NO;
    sonShangView_one.hidden = NO;
    sonShangView_two.hidden = YES;
    suanType = @"单价计算";
    //回收键盘
    [shangZong resignFirstResponder];
}
-(void)zongBtnAction:(UIButton *)btn
{
    shangZongBtn.selected = YES;
    shangDanBtn.selected = NO;
    sonShangView_two.hidden = NO;
    sonShangView_one.hidden = YES;
    suanType = @"总价计算";
    //回收键盘
    [shangJiaGe resignFirstResponder];
    [shangMianJi resignFirstResponder];
}


#pragma mark ----------添加公积金贷款视图----------
//公积金贷款
-(void)addGongjiView
{
    gongView = [[UIView alloc]init];
    gongView.hidden = YES;
    gongView.frame = CGRectMake(10, 70, SCREEN_WIDTH-20, 500);
    gongView.backgroundColor = [UIColor clearColor];
    //添加房款计价方式
    UIImageView * twoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 45)];
    twoImgView.userInteractionEnabled = YES;
    [gongView addSubview:twoImgView];
    [twoImgView release];
    //视图添加手势
    UITapGestureRecognizer *singleFingerOne_smal = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoad)];
    singleFingerOne_smal.numberOfTouchesRequired = 1; //手指数
    singleFingerOne_smal.numberOfTapsRequired = 1; //tap次数
    singleFingerOne_smal.delegate = self;
    [twoImgView addGestureRecognizer:singleFingerOne_smal];
    
    //添加房款计价方式
    UILabel *label11=[[UILabel alloc]initWithFrame:CGRectMake(20, 12, 100, 20)];
    label11.text=@"计算方式";
    label11.textColor=DEEP_TEXT_COLOR;
    label11.font=[UIFont systemFontOfSize:17];
    [gongView addSubview:label11];
    [label11 release];

    //添加计价方式按钮
    //按照单价
    gongDanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    gongDanBtn.frame = CGRectMake((SCREEN_WIDTH-20)/3+5, 12, 20, 20);
    [gongDanBtn setImage:[UIImage imageNamed:@"圆未选.png"] forState:UIControlStateNormal];
    [gongDanBtn setImage:[UIImage imageNamed:@"圆选中.png"] forState:UIControlStateSelected];
    [gongDanBtn addTarget:self action:@selector(gongDanAction:) forControlEvents:UIControlEventTouchUpInside];
    [twoImgView addSubview:gongDanBtn];
    //按照总价
    gongZongBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    gongZongBtn.frame = CGRectMake(2*(SCREEN_WIDTH-20)/3+5, 12, 20, 20);
    [gongZongBtn setImage:[UIImage imageNamed:@"圆未选.png"] forState:UIControlStateNormal];
    [gongZongBtn setImage:[UIImage imageNamed:@"圆选中.png"] forState:UIControlStateSelected];
    [gongZongBtn addTarget:self action:@selector(gongZongAction:) forControlEvents:UIControlEventTouchUpInside];
    [twoImgView addSubview:gongZongBtn];
    
    //按照单价
    gongDanBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    gongDanBtn2.frame = CGRectMake((SCREEN_WIDTH-20)/3+5, 5, 80, 30);
    [gongDanBtn2 addTarget:self action:@selector(gongDanAction:) forControlEvents:UIControlEventTouchUpInside];
    [twoImgView addSubview:gongDanBtn2];
    //按照总价
    gongZongBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    gongZongBtn2.frame = CGRectMake(2*(SCREEN_WIDTH-20)/3+5, 5, 80, 30);
    [gongZongBtn2 addTarget:self action:@selector(gongZongAction:) forControlEvents:UIControlEventTouchUpInside];
    [twoImgView addSubview:gongZongBtn2];
    
    UILabel *label12=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-20)/3+30, 12, 100, 20)];
    label12.text=@"按单价";
    label12.textColor=DEEP_TEXT_COLOR;
    label12.font=[UIFont systemFontOfSize:17];
    [gongView addSubview:label12];
    [label12 release];
    
    UILabel *label13=[[UILabel alloc]initWithFrame:CGRectMake(2*(SCREEN_WIDTH-20)/3+30, 12, 100, 20)];
    label13.text=@"按总额";
    label13.textColor=DEEP_TEXT_COLOR;
    label13.font=[UIFont systemFontOfSize:17];
    [gongView addSubview:label13];
    [label13 release];
    
    [userContentView addSubview:gongView];
    [gongView release];
    
    //单价计算详细页面
    sonGongView_one = [[UIView alloc]initWithFrame:CGRectMake(0, 45, SCREEN_WIDTH-20, 368)];
    sonGongView_one.backgroundColor = [UIColor clearColor];
    sonGongView_one.hidden = YES;
    [gongView addSubview:sonGongView_one];
    [sonGongView_one release];
    UIImageView * oneImgView_shang = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 268)];
    oneImgView_shang.userInteractionEnabled = YES;
    [sonGongView_one addSubview:oneImgView_shang];
    [oneImgView_shang release];
    //视图添加手势
    UITapGestureRecognizer *singleFingerOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoad)];
    singleFingerOne.numberOfTouchesRequired = 1; //手指数
    singleFingerOne.numberOfTapsRequired = 1; //tap次数
    singleFingerOne.delegate = self;
    [oneImgView_shang addGestureRecognizer:singleFingerOne];
    //添加按钮
    UIButton * shangOneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shangOneBtn.frame =CGRectMake(20, 280, SCREEN_WIDTH-60, 45);
    [shangOneBtn setTitle:@"开始计算" forState:UIControlStateNormal];
    [shangOneBtn setBackgroundColor:[UIColor colorWithRed:252/255.0 green:102/255.0 blue:40/255.0 alpha:100]];
    shangOneBtn.layer.masksToBounds=YES;
    shangOneBtn.layer.cornerRadius=5;
    [shangOneBtn addTarget:self action:@selector(jiSuanAction:) forControlEvents:UIControlEventTouchUpInside];
    [sonGongView_one addSubview:shangOneBtn];
    //添加输入部分信息
    //单价部分
    UILabel *label21=[[UILabel alloc]initWithFrame:CGRectMake(20, 12, 100, 20)];
    label21.text=@"单价";
    label21.textColor=DEEP_TEXT_COLOR;
    label21.font=[UIFont systemFontOfSize:17];
    [sonGongView_one addSubview:label21];
    [label21 release];
    
    UILabel *label22=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-70, 12, 100, 20)];
    label22.text=@"元/平米";
    label22.textColor=DEEP_TEXT_COLOR;
    label22.font=[UIFont systemFontOfSize:17];
    [sonGongView_one addSubview:label22];
    [label22 release];
    
    UIImageView * inputImg_zong_one = [[UIImageView alloc]initWithFrame:CGRectMake(80, 7, SCREEN_WIDTH-150, 30)];
    inputImg_zong_one.userInteractionEnabled = YES;
    [sonGongView_one addSubview:inputImg_zong_one];
    [inputImg_zong_one release];
    gongJiaGe = [[UITextField alloc]initWithFrame:CGRectMake(1, 5, SCREEN_WIDTH-150, 20)];
    gongJiaGe.borderStyle = UITextBorderStyleNone;
    gongJiaGe.backgroundColor = [UIColor clearColor];
    gongJiaGe.keyboardType = UIKeyboardTypeDecimalPad;
    gongJiaGe.autocapitalizationType = UITextAutocapitalizationTypeNone;
    gongJiaGe.font = [UIFont systemFontOfSize:15];
    gongJiaGe.textAlignment = NSTextAlignmentCenter;
    [gongJiaGe setUserInteractionEnabled:YES];
    gongJiaGe.clearButtonMode = UITextFieldViewModeWhileEditing;
    [inputImg_zong_one addSubview:gongJiaGe];
    [gongJiaGe release];
    
    //面积部分
    UILabel *label31=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45, 100, 20)];
    label31.text=@"面积";
    label31.textColor=DEEP_TEXT_COLOR;
    label31.font=[UIFont systemFontOfSize:17];
    [sonGongView_one addSubview:label31];
    [label31 release];
    
    UILabel *label32=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-70, 12+45, 100, 20)];
    label32.text=@"平米";
    label32.textColor=DEEP_TEXT_COLOR;
    label32.font=[UIFont systemFontOfSize:17];
    [sonGongView_one addSubview:label32];
    [label32 release];
    
    UIImageView * inputImg_zong_two = [[UIImageView alloc]initWithFrame:CGRectMake(80, 52, SCREEN_WIDTH-150, 30)];
    inputImg_zong_two.userInteractionEnabled = YES;
    [sonGongView_one addSubview:inputImg_zong_two];
    [inputImg_zong_two release];
    gongMianJi = [[UITextField alloc]initWithFrame:CGRectMake(1, 5, SCREEN_WIDTH-150, 20)];
    gongMianJi.borderStyle = UITextBorderStyleNone;
    gongMianJi.backgroundColor = [UIColor clearColor];
    gongMianJi.keyboardType = UIKeyboardTypeDecimalPad;
    gongMianJi.autocapitalizationType = UITextAutocapitalizationTypeNone;
    gongMianJi.font = [UIFont systemFontOfSize:15];
    gongMianJi.textAlignment = NSTextAlignmentCenter;
    [gongMianJi setUserInteractionEnabled:YES];
    gongMianJi.clearButtonMode = UITextFieldViewModeWhileEditing;
    [inputImg_zong_two addSubview:gongMianJi];
    [gongMianJi release];

    //按揭成数
    UILabel *label41=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45*2, 100, 20)];
    label41.text=@"首付成数";
    label41.textColor=DEEP_TEXT_COLOR;
    label41.font=[UIFont systemFontOfSize:17];
    [sonGongView_one addSubview:label41];
    [label41 release];
    
    UIButton * btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    btnOne.frame = CGRectMake(110, 97, SCREEN_WIDTH-120, 30);
    btnOne.tag = 6;
    [btnOne addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    [sonGongView_one addSubview:btnOne];
    UIImageView *downImage=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-52, 12+45*2,20, 20)];
    downImage.image=[UIImage imageNamed:@"down_arrow.png"];
    [sonGongView_one addSubview:downImage];
    
    gongDanCheng = [[UILabel alloc]initWithFrame:CGRectMake(2, 3, 135, 24)];
    gongDanCheng.textAlignment = NSTextAlignmentCenter;
    gongDanCheng.backgroundColor = [UIColor clearColor];
    gongDanCheng.text = [array_1 objectAtIndex:1];
    gongDanCheng.font = [UIFont systemFontOfSize:16];
    [btnOne addSubview:gongDanCheng];
    [gongDanCheng release];
    //按揭年数
    UILabel *label51=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45*3, 100, 20)];
    label51.text=@"按揭年数";
    label51.textColor=DEEP_TEXT_COLOR;
    label51.font=[UIFont systemFontOfSize:17];
    [sonGongView_one addSubview:label51];
    [label51 release];
    
    UIButton * btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTwo.frame = CGRectMake(110, 142, SCREEN_WIDTH-120, 30);
    btnTwo.tag = 7;
    [btnTwo addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    [sonGongView_one addSubview:btnTwo];
    UIImageView *downImage2=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-52, 12+45*3,20, 20)];
    downImage2.image=[UIImage imageNamed:@"down_arrow.png"];
    [sonGongView_one addSubview:downImage2];
    
    gongDanNian = [[UILabel alloc]initWithFrame:CGRectMake(2, 3, 135, 24)];
    gongDanNian.textAlignment = NSTextAlignmentCenter;
    gongDanNian.backgroundColor = [UIColor clearColor];
    gongDanNian.text = [array_2 objectAtIndex:19];
    gongDanNian.font = [UIFont systemFontOfSize:16];
    [btnTwo addSubview:gongDanNian];
    [gongDanNian release];
    //利率
    UILabel *label61=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45*4, 100, 20)];
    label61.text=@"利率";
    label61.textColor=DEEP_TEXT_COLOR;
    label61.font=[UIFont systemFontOfSize:17];
    [sonGongView_one addSubview:label61];
    [label61 release];
    
    UIButton * btnTre = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTre.frame = CGRectMake(110, 187, SCREEN_WIDTH-120, 30);
    btnTre.tag = 8;
    [btnTre addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    [sonGongView_one addSubview:btnTre];
    UIImageView *downImage3=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-52, 12+45*4,20, 20)];
    downImage3.image=[UIImage imageNamed:@"down_arrow.png"];
    [sonGongView_one addSubview:downImage3];
    
    gongDanLiLv = [[UILabel alloc]initWithFrame:CGRectMake(2, 3, 135, 24)];
    gongDanLiLv.textAlignment = NSTextAlignmentCenter;
    gongDanLiLv.backgroundColor = [UIColor clearColor];
    gongDanLiLv.text = [array_3 objectAtIndex:0];
    gongDanLiLv.font = [UIFont systemFontOfSize:16];
    [btnTre addSubview:gongDanLiLv];
    [gongDanLiLv release];
    //显示利率
    label_3 = [[UILabel alloc]initWithFrame:CGRectMake(110, 235, 167, 25)];
    label_3.font = [UIFont systemFontOfSize:16];
    label_3.text = [array_5 objectAtIndex:0];
    label_3.textAlignment = NSTextAlignmentCenter;
    label_3.backgroundColor = [UIColor clearColor];
    [sonGongView_one addSubview:label_3];
    [label_3 release];
    
    //总价计算详细页面
    sonGongView_two = [[UIView alloc]initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 288)];
    sonGongView_two.backgroundColor = [UIColor clearColor];
    sonGongView_two.hidden = YES;
    [gongView addSubview:sonGongView_two];
    [sonGongView_two release];
    UIImageView * twoImgView_shang = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 188)];
    twoImgView_shang.userInteractionEnabled = YES;
    [sonGongView_two addSubview:twoImgView_shang];
    [twoImgView_shang release];
    //视图添加手势
    UITapGestureRecognizer *singleZong = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoad)];
    singleZong.numberOfTouchesRequired = 1; //手指数
    singleZong.numberOfTapsRequired = 1; //tap次数
    singleZong.delegate = self;
    [twoImgView_shang addGestureRecognizer:singleZong];
    //贷款总额输入部分
    UILabel *label211=[[UILabel alloc]initWithFrame:CGRectMake(20, 12, 100, 20)];
    label211.text=@"贷款总额";
    label211.textColor=DEEP_TEXT_COLOR;
    label211.font=[UIFont systemFontOfSize:17];
    [sonGongView_two addSubview:label211];
    [label211 release];
    
    UILabel *label212=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-70, 12, 100, 20)];
    label212.text=@"万元";
    label212.textColor=DEEP_TEXT_COLOR;
    label212.font=[UIFont systemFontOfSize:17];
    [sonGongView_two addSubview:label212];
    [label212 release];
    
    UIImageView * inputImg_zong = [[UIImageView alloc]initWithFrame:CGRectMake(90, 8, SCREEN_WIDTH-160, 30)];
    inputImg_zong.userInteractionEnabled = YES;
    //inputImg_zong.image = [UIImage imageNamed:@"input.png"];
    [sonGongView_two addSubview:inputImg_zong];
    [inputImg_zong release];
    gongZong = [[UITextField alloc]initWithFrame:CGRectMake(1, 5, SCREEN_WIDTH-160, 20)];
    gongZong.borderStyle = UITextBorderStyleNone;
    gongZong.backgroundColor = [UIColor clearColor];
    gongZong.keyboardType = UIKeyboardTypeDecimalPad;
    gongZong.autocapitalizationType = UITextAutocapitalizationTypeNone;
    gongZong.font = [UIFont systemFontOfSize:15];
    gongZong.textAlignment = NSTextAlignmentCenter;
    [gongZong setUserInteractionEnabled:YES];
    gongZong.clearButtonMode = UITextFieldViewModeWhileEditing;
    [inputImg_zong addSubview:gongZong];
    [gongZong release];
    
    //按揭年数
    UILabel *label221=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45, 100, 20)];
    label221.text=@"按揭年数";
    label221.textColor=DEEP_TEXT_COLOR;
    label221.font=[UIFont systemFontOfSize:17];
    [sonGongView_two addSubview:label221];
    [label221 release];
    
    UIButton * btnOne_one = [UIButton buttonWithType:UIButtonTypeCustom];
    btnOne_one.frame = CGRectMake(110, 52, SCREEN_WIDTH-120, 30);
    btnOne_one.tag = 9;
    [btnOne_one addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    [sonGongView_two addSubview:btnOne_one];
    
    UIImageView *downImage11=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-52, 12+45,20, 20)];
    downImage11.image=[UIImage imageNamed:@"down_arrow.png"];
    [sonGongView_two addSubview:downImage11];
    
    gongZongNian = [[UILabel alloc]initWithFrame:CGRectMake(2, 3, 135, 24)];
    gongZongNian.textAlignment = NSTextAlignmentCenter;
    gongZongNian.backgroundColor = [UIColor clearColor];
    gongZongNian.text = [array_2 objectAtIndex:19];
    gongZongNian.font = [UIFont systemFontOfSize:16];
    [btnOne_one addSubview:gongZongNian];
    [gongZongNian release];
    //利率
    UILabel *label231=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45*2, 100, 20)];
    label231.text=@"利率";
    label231.textColor=DEEP_TEXT_COLOR;
    label231.font=[UIFont systemFontOfSize:17];
    [sonGongView_two addSubview:label231];
    [label231 release];
    
    UIButton * btnOne_two = [UIButton buttonWithType:UIButtonTypeCustom];
    btnOne_two.frame = CGRectMake(110, 96, SCREEN_WIDTH-120, 30);
    btnOne_two.tag = 10;
    [btnOne_two addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    [sonGongView_two addSubview:btnOne_two];
    UIImageView *downImage12=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-52, 12+45*2,20, 20)];
    downImage12.image=[UIImage imageNamed:@"down_arrow.png"];
    [sonGongView_two addSubview:downImage12];
    
    gongZongLiLv = [[UILabel alloc]initWithFrame:CGRectMake(2, 3, 135, 24)];
    gongZongLiLv.textAlignment = NSTextAlignmentCenter;
    gongZongLiLv.backgroundColor = [UIColor clearColor];
    gongZongLiLv.text = [array_3 objectAtIndex:0];
    gongZongLiLv.font = [UIFont systemFontOfSize:16];
    [btnOne_two addSubview:gongZongLiLv];
    [gongZongLiLv release];
    //显示利率
    label_4 = [[UILabel alloc]initWithFrame:CGRectMake(110, 142, 167, 25)];
    label_4.font = [UIFont systemFontOfSize:16];
    label_4.text = [array_5 objectAtIndex:0];
    label_4.textAlignment = NSTextAlignmentCenter;
    label_4.backgroundColor = [UIColor clearColor];
    [sonGongView_two addSubview:label_4];
    [label_4 release];
    

    
    //添加按钮
    UIButton * shangTwoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shangTwoBtn.frame = CGRectMake(20, 200, SCREEN_WIDTH-60, 45);
    [shangTwoBtn setTitle:@"开始计算" forState:UIControlStateNormal];
    [shangTwoBtn setBackgroundColor:[UIColor colorWithRed:252/255.0 green:102/255.0 blue:40/255.0 alpha:100]];
    shangTwoBtn.layer.masksToBounds=YES;
    shangTwoBtn.layer.cornerRadius=5;
    [shangTwoBtn addTarget:self action:@selector(jiSuanAction:) forControlEvents:UIControlEventTouchUpInside];
    [sonGongView_two addSubview:shangTwoBtn];
    
    //默认选中按单价选择按钮
    gongDanBtn.selected = YES;
    [self gongDanAction:gongDanBtn];
    
    for(int i=0;i<7;i++){
        UILabel *henglabel=[[UILabel alloc]initWithFrame:CGRectMake(0, i*45, SCREEN_WIDTH, 0.7)];
        henglabel.backgroundColor=LIGHT_BACK_COLOR;
        [sonGongView_one addSubview:henglabel];
    }
    
    for(int i=0;i<5;i++){
        UILabel *henglabel=[[UILabel alloc]initWithFrame:CGRectMake(0, i*45, SCREEN_WIDTH, 0.7)];
        henglabel.backgroundColor=LIGHT_BACK_COLOR;
        [sonGongView_two addSubview:henglabel];
    }
        
    
    [self reloadLabel3];
    [self reloadLabel4];
}
-(void)gongDanAction:(UIButton *)btn
{
    gongDanBtn.selected = YES;
    gongZongBtn.selected = NO;
    sonGongView_one.hidden = NO;
    sonGongView_two.hidden = YES;
    suanType = @"单价计算";
    //回收键盘
    [gongZong resignFirstResponder];
}
-(void)gongZongAction:(UIButton *)btn
{
    gongZongBtn.selected = YES;
    gongDanBtn.selected = NO;
    sonGongView_two.hidden = NO;
    sonGongView_one.hidden = YES;
    suanType = @"总价计算";
    //回收键盘
    [gongJiaGe resignFirstResponder];
    [gongMianJi resignFirstResponder];
}


#pragma mark ----------添加组合贷款视图----------
//组合型贷款
-(void)addZuheView
{
    zuHeView = [[UIView alloc]init];
    zuHeView.hidden = YES;
    zuHeView.frame = CGRectMake(10, 70, SCREEN_WIDTH-20, 450);
    zuHeView.backgroundColor = [UIColor clearColor];
    [userContentView addSubview:zuHeView];
    [zuHeView release];
    //添加组合贷款页面
    UIImageView * zuHeImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 259)];
    zuHeImgView.userInteractionEnabled = YES;
    [zuHeView addSubview:zuHeImgView];
    [zuHeImgView release];
    //视图添加手势
    UITapGestureRecognizer *singleZong = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoad)];
    singleZong.numberOfTouchesRequired = 1; //手指数
    singleZong.numberOfTapsRequired = 1; //tap次数
    singleZong.delegate = self;
    [zuHeImgView addGestureRecognizer:singleZong];
    //公积金贷款输入部分
    UILabel *label11=[[UILabel alloc]initWithFrame:CGRectMake(20, 12, 100, 20)];
    label11.text=@"公积金贷款";
    label11.textColor=DEEP_TEXT_COLOR;
    label11.font=[UIFont systemFontOfSize:17];
    [zuHeImgView addSubview:label11];
    [label11 release];
    
    UILabel *label12=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-70, 12, 100, 20)];
    label12.text=@"万元";
    label12.textColor=DEEP_TEXT_COLOR;
    label12.font=[UIFont systemFontOfSize:17];
    [zuHeImgView addSubview:label12];
    [label12  release];
    
    UIImageView * inputImg_zong_one = [[UIImageView alloc]initWithFrame:CGRectMake(110, 8, SCREEN_WIDTH-185, 30)];
    inputImg_zong_one.userInteractionEnabled = YES;
    [zuHeImgView addSubview:inputImg_zong_one];
    [inputImg_zong_one release];
    gongDai = [[UITextField alloc]initWithFrame:CGRectMake(1, 5, SCREEN_WIDTH-185, 20)];
    gongDai.borderStyle = UITextBorderStyleNone;
    gongDai.backgroundColor = [UIColor clearColor];
    gongDai.keyboardType = UIKeyboardTypeDecimalPad;
    gongDai.autocapitalizationType = UITextAutocapitalizationTypeNone;
    gongDai.font = [UIFont systemFontOfSize:15];
    gongDai.textAlignment = NSTextAlignmentCenter;
    [gongDai setUserInteractionEnabled:YES];
    gongDai.clearButtonMode = UITextFieldViewModeWhileEditing;
    [inputImg_zong_one addSubview:gongDai];
    [gongDai release];
    //商业贷款输入部分
    UILabel *label21=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45, 100, 20)];
    label21.text=@"商业贷款";
    label21.textColor=DEEP_TEXT_COLOR;
    label21.font=[UIFont systemFontOfSize:17];
    [zuHeImgView addSubview:label21];
    [label21 release];
    
    UILabel *label22=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-70, 12+45, 100, 20)];
    label22.text=@"万元";
    label22.textColor=DEEP_TEXT_COLOR;
    label22.font=[UIFont systemFontOfSize:17];
    [zuHeImgView addSubview:label22];
    [label22  release];
    
    UIImageView * inputImg_zong_two = [[UIImageView alloc]initWithFrame:CGRectMake(90, 52, SCREEN_WIDTH-165, 30)];
    inputImg_zong_two.userInteractionEnabled = YES;
    [zuHeImgView addSubview:inputImg_zong_two];
    [inputImg_zong_two release];
    shangDai = [[UITextField alloc]initWithFrame:CGRectMake(1, 5, SCREEN_WIDTH-165, 20)];
    shangDai.borderStyle = UITextBorderStyleNone;
    shangDai.backgroundColor = [UIColor clearColor];
    shangDai.keyboardType = UIKeyboardTypeDecimalPad;
    shangDai.autocapitalizationType = UITextAutocapitalizationTypeNone;
    shangDai.font = [UIFont systemFontOfSize:15];
    shangDai.textAlignment = NSTextAlignmentCenter;
    [shangDai setUserInteractionEnabled:YES];
    shangDai.clearButtonMode = UITextFieldViewModeWhileEditing;
    [inputImg_zong_two addSubview:shangDai];
    [shangDai release];
       //按揭年数
    UILabel *label31=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45*2, 100, 20)];
    label31.text=@"按揭年数";
    label31.textColor=DEEP_TEXT_COLOR;
    label31.font=[UIFont systemFontOfSize:17];
    [zuHeImgView addSubview:label31];
    [label31 release];
    
    UIButton * btnOne_one = [UIButton buttonWithType:UIButtonTypeCustom];
    btnOne_one.frame = CGRectMake(110, 98, SCREEN_WIDTH-120, 30);
    btnOne_one.tag = 11;
    [btnOne_one addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    [zuHeImgView addSubview:btnOne_one];
    UIImageView *downImage1=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-52, 12+45*2,20, 20)];
    downImage1.image=[UIImage imageNamed:@"down_arrow.png"];
    [zuHeImgView addSubview:downImage1];

    
    zuHeNian = [[UILabel alloc]initWithFrame:CGRectMake(2, 3, 135, 24)];
    zuHeNian.textAlignment = NSTextAlignmentCenter;
    zuHeNian.backgroundColor = [UIColor clearColor];
    zuHeNian.text = [array_2 objectAtIndex:19];
    zuHeNian.font = [UIFont systemFontOfSize:16];
    [btnOne_one addSubview:zuHeNian];
    [zuHeNian release];
       //利率
    UILabel *label41=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45*3, 100, 20)];
    label41.text=@"利率";
    label41.textColor=DEEP_TEXT_COLOR;
    label41.font=[UIFont systemFontOfSize:17];
    [zuHeImgView addSubview:label41];
    [label41 release];
    
    UIButton * btnOne_two = [UIButton buttonWithType:UIButtonTypeCustom];
    btnOne_two.frame = CGRectMake(110, 142, SCREEN_WIDTH-120, 30);
    btnOne_two.tag = 12;
    [btnOne_two addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    [zuHeImgView addSubview:btnOne_two];
    UIImageView *downImage2=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-52, 12+45*3,20, 20)];
    downImage2.image=[UIImage imageNamed:@"down_arrow.png"];
    [zuHeImgView addSubview:downImage2];
    
    zuHeLiLv = [[UILabel alloc]initWithFrame:CGRectMake(2, 3, 135, 24)];
    zuHeLiLv.textAlignment = NSTextAlignmentCenter;
    zuHeLiLv.backgroundColor = [UIColor clearColor];
    zuHeLiLv.text = [array_3 objectAtIndex:0];
    zuHeLiLv.font = [UIFont systemFontOfSize:16];
    [btnOne_two addSubview:zuHeLiLv];
    [zuHeLiLv release];
    //显示利率
    label_5 = [[UILabel alloc]initWithFrame:CGRectMake(110, 190, 200, 25)];
    label_5.font = [UIFont systemFontOfSize:16];
    label_5.text = [NSString stringWithFormat:@"公积金贷款利率 %@",[array_5 objectAtIndex:0]];
    label_5.backgroundColor = [UIColor clearColor];
    [zuHeImgView addSubview:label_5];
    [label_5 release];
    
    label_6 = [[UILabel alloc]initWithFrame:CGRectMake(110, 235, 200, 25)];
    label_6.font = [UIFont systemFontOfSize:16];
    label_6.text = [NSString stringWithFormat:@"商业贷款利率 %@",[array_4 objectAtIndex:0]];
    label_6.backgroundColor = [UIColor clearColor];
    [zuHeImgView addSubview:label_6];
    [label_6 release];
    
    for(int i=0;i<7;i++){
        UILabel *henglabel=[[UILabel alloc]initWithFrame:CGRectMake(0, i*45, SCREEN_WIDTH, 0.7)];
        henglabel.backgroundColor=LIGHT_BACK_COLOR;
        [zuHeImgView addSubview:henglabel];
    }
    
    //添加计算按钮
    UIButton * shangTwoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shangTwoBtn.frame = CGRectMake(20, 280, SCREEN_WIDTH-60, 45);
    [shangTwoBtn setTitle:@"开始计算" forState:UIControlStateNormal];
    [shangTwoBtn setBackgroundColor:[UIColor colorWithRed:252/255.0 green:102/255.0 blue:40/255.0 alpha:100]];
    shangTwoBtn.layer.masksToBounds=YES;
    shangTwoBtn.layer.cornerRadius=5;
    [shangTwoBtn addTarget:self action:@selector(jiSuanAction:) forControlEvents:UIControlEventTouchUpInside];
    [zuHeView addSubview:shangTwoBtn];
    
    [self reloadLabel5];
}


#pragma mark ----------添加税费计算视图----------

//税费计算
-(void)addShuiFeiView{
    shuifeiView = [[UIView alloc]init];
    shuifeiView.hidden = YES;
    shuifeiView.frame = CGRectMake(0, 70, SCREEN_WIDTH, 450);
    shuifeiView.backgroundColor = [UIColor clearColor];
    [userContentView addSubview:shuifeiView];
    [shuifeiView release];
    
    //添加组合贷款页面
    UIImageView * zushuiView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 259)];
    zushuiView.userInteractionEnabled = YES;
    [shuifeiView addSubview:zushuiView];
    [zushuiView release];
    //视图添加手势
    UITapGestureRecognizer *singleZong = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoad)];
    singleZong.numberOfTouchesRequired = 1; //手指数
    singleZong.numberOfTapsRequired = 1; //tap次数
    singleZong.delegate = self;
    [zushuiView addGestureRecognizer:singleZong];
    
    newBtn=[[UIButton alloc]initWithFrame:CGRectMake(30, 20, SCREEN_WIDTH/2-35, 40)];
    [newBtn setTitle:@"新房" forState:UIControlStateNormal];
    [newBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    newBtn.backgroundColor=AliRedColor;
    newBtn.layer.masksToBounds=YES;
    newBtn.layer.cornerRadius=5;
    [newBtn addTarget:self action:@selector(newShuiAction:) forControlEvents:UIControlEventTouchUpInside];
    [zushuiView addSubview:newBtn];
    
    erBtn=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2+5, 20, SCREEN_WIDTH/2-35, 40)];
    [erBtn setTitle:@"二手房" forState:UIControlStateNormal];
    [erBtn setTitleColor:[UIColor colorWithRed:252/255.0 green:102/255.0 blue:40/255.0 alpha:100] forState:UIControlStateNormal];
    erBtn.backgroundColor=LIGHT_BACK_COLOR;
    erBtn.layer.masksToBounds=YES;
    erBtn.layer.cornerRadius=5;
    [erBtn addTarget:self action:@selector(erShuiAction:) forControlEvents:UIControlEventTouchUpInside];
    [zushuiView addSubview:erBtn];
    
    
    newShuiView = [[UIView alloc]initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, 400)];
    newShuiView.backgroundColor = [UIColor clearColor];
    newShuiView.hidden = NO;
    [shuifeiView addSubview:newShuiView];
    
    UIImageView * oneImgView_shang = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 268)];
    oneImgView_shang.userInteractionEnabled = YES;
    [newShuiView addSubview:oneImgView_shang];
    [oneImgView_shang release];
    //视图添加手势
    UITapGestureRecognizer *singleFingerOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoad)];
    singleFingerOne.numberOfTouchesRequired = 1; //手指数
    singleFingerOne.numberOfTapsRequired = 1; //tap次数
    singleFingerOne.delegate = self;
    [oneImgView_shang addGestureRecognizer:singleFingerOne];
    
    UILabel *label21=[[UILabel alloc]initWithFrame:CGRectMake(20, 12, 100, 21)];
    label21.text=@"房屋面积:";
    label21.textColor=DEEP_TEXT_COLOR;
    label21.font=[UIFont systemFontOfSize:17];
    [newShuiView addSubview:label21];
    [label21 release];
    
    UILabel *label31=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45, 100, 21)];
    label31.text=@"面积单价:";
    label31.textColor=DEEP_TEXT_COLOR;
    label31.font=[UIFont systemFontOfSize:17];
    [newShuiView addSubview:label31];
    [label31 release];
    
    UILabel *label41=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45*2, 100, 21)];
    label41.text=@"住宅类型:";
    label41.textColor=DEEP_TEXT_COLOR;
    label41.font=[UIFont systemFontOfSize:17];
    [newShuiView addSubview:label41];
    [label41 release];
    
    UILabel *label51=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45*3, 100, 21)];
    label51.text=@"是否唯一:";
    label51.textColor=DEEP_TEXT_COLOR;
    label51.font=[UIFont systemFontOfSize:17];
    [newShuiView addSubview:label51];
    [label51 release];
    
    weiyiBtn1=[[UIButton alloc]initWithFrame:CGRectMake(100, 12+45*3, 20, 20)];
    [weiyiBtn1 setImage:[UIImage imageNamed:@"圆未选.png"] forState:UIControlStateNormal];
    [weiyiBtn1 setImage:[UIImage imageNamed:@"圆选中.png"] forState:UIControlStateSelected];
    [weiyiBtn1 addTarget:self action:@selector(weiyi1Action:) forControlEvents:UIControlEventTouchUpInside];
    [newShuiView addSubview:weiyiBtn1];
    weiyiBtn1.selected=YES;
    
    UILabel *weiyilabel1=[[UILabel alloc]initWithFrame:CGRectMake(130, 12+45*3, 20, 21)];
    weiyilabel1.text=@"是";
    weiyilabel1.textColor=DEEP_TEXT_COLOR;
    weiyilabel1.font=[UIFont systemFontOfSize:17];
    [newShuiView addSubview:weiyilabel1];
    [weiyilabel1 release];
    
    weiyiBtn2=[[UIButton alloc]initWithFrame:CGRectMake(155, 12+45*3, 20, 20)];
    [weiyiBtn2 setImage:[UIImage imageNamed:@"圆未选.png"] forState:UIControlStateNormal];
    [weiyiBtn2 setImage:[UIImage imageNamed:@"圆选中.png"] forState:UIControlStateSelected];
    [weiyiBtn2 addTarget:self action:@selector(weiyi2Action:) forControlEvents:UIControlEventTouchUpInside];
    [newShuiView addSubview:weiyiBtn2];
    
    UILabel *weiyilabel2=[[UILabel alloc]initWithFrame:CGRectMake(185, 12+45*3, 20, 21)];
    weiyilabel2.text=@"否";
    weiyilabel2.textColor=DEEP_TEXT_COLOR;
    weiyilabel2.font=[UIFont systemFontOfSize:17];
    [newShuiView addSubview:weiyilabel2];
    [weiyilabel2 release];
    
    newMianjiText=[[UITextField alloc]initWithFrame:CGRectMake(100, 12, SCREEN_WIDTH-150, 21)];
    newMianjiText.placeholder=@"输入面积";
    newMianjiText.textAlignment=1;
    newMianjiText.textColor=DEEP_TEXT_COLOR;
    newMianjiText.font=[UIFont systemFontOfSize:17];
    newMianjiText.keyboardType=UIKeyboardTypeDecimalPad;
    [newShuiView addSubview:newMianjiText];
    [newMianjiText release];
    
    newDanText=[[UITextField alloc]initWithFrame:CGRectMake(100, 12+45, SCREEN_WIDTH-150, 21)];
    newDanText.placeholder=@"输入单价";
    newDanText.textAlignment=1;
    newDanText.textColor=DEEP_TEXT_COLOR;
    newDanText.keyboardType=UIKeyboardTypeDecimalPad;
    newDanText.font=[UIFont systemFontOfSize:17];
    [newShuiView addSubview:newDanText];
    [newDanText release];
    
    newputongL=[[UILabel alloc]initWithFrame:CGRectMake(100, 12+45*2, SCREEN_WIDTH-150, 21)];
    newputongL.text=@"普通住宅";
    newputongL.textAlignment=1;
    newputongL.textColor=DEEP_TEXT_COLOR;
    newputongL.font=[UIFont systemFontOfSize:17];
    [newShuiView addSubview:newputongL];
    [newputongL release];
    
    UIButton *newputongBtn=[[UIButton alloc]initWithFrame:CGRectMake(80, 7+45*2, SCREEN_WIDTH-90, 31)];
    [newputongBtn addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    newputongBtn.tag=21;
    [newShuiView addSubview:newputongBtn];
    //[newputongBtn release];
    
    UILabel *labelright1=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-40, 12, 40, 21)];
    labelright1.text=@"平米";
    labelright1.textColor=DEEP_TEXT_COLOR;
    labelright1.font=[UIFont systemFontOfSize:17];
    [newShuiView addSubview:labelright1];
    [labelright1 release];
    
    UILabel *labelright2=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-40, 12+45, 30, 21)];
    labelright2.text=@"元";
    labelright2.textColor=DEEP_TEXT_COLOR;
    labelright2.font=[UIFont systemFontOfSize:17];
    [newShuiView addSubview:labelright2];
    [labelright2 release];
    
    UIButton *rightBtn3=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-40, 12+45*2, 20, 20)];
    [rightBtn3 setImage:[UIImage imageNamed:@"down_arrow.png"] forState:UIControlStateNormal];
    [rightBtn3 addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    [newShuiView addSubview:rightBtn3];
    
    //添加按钮
    UIButton * shuiOneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shuiOneBtn.frame = CGRectMake(30, 12+45*3+40, SCREEN_WIDTH-60, 45);
    [shuiOneBtn setTitle:@"开始计算" forState:UIControlStateNormal];
    [shuiOneBtn setBackgroundColor:[UIColor colorWithRed:252/255.0 green:102/255.0 blue:40/255.0 alpha:100]];
    shuiOneBtn.layer.masksToBounds=YES;
    shuiOneBtn.layer.cornerRadius=5;
    [shuiOneBtn addTarget:self action:@selector(jiSuanAction:) forControlEvents:UIControlEventTouchUpInside];
    [newShuiView addSubview:shuiOneBtn];
    
    //二手房部分
    erShuiView = [[UIView alloc]initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, 400)];
    erShuiView.backgroundColor = [UIColor clearColor];
    erShuiView.hidden = YES;
    [shuifeiView addSubview:erShuiView];
    
    UIImageView * twoImgView_shang = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 268)];
    twoImgView_shang.userInteractionEnabled = YES;
    [erShuiView addSubview:twoImgView_shang];
    [twoImgView_shang release];
    //视图添加手势
    singleFingerOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoad)];
    singleFingerOne.numberOfTouchesRequired = 1; //手指数
    singleFingerOne.numberOfTapsRequired = 1; //tap次数
    singleFingerOne.delegate = self;
    [twoImgView_shang addGestureRecognizer:singleFingerOne];
    
    UILabel *label61=[[UILabel alloc]initWithFrame:CGRectMake(20, 12, 100, 21)];
    label61.text=@"房屋面积:";
    label61.textColor=DEEP_TEXT_COLOR;
    label61.font=[UIFont systemFontOfSize:17];
    [erShuiView addSubview:label61];
    [label61 release];
    
    UILabel *label42=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45, 100, 21)];
    label42.text=@"面积单价:";
    label42.textColor=DEEP_TEXT_COLOR;
    label42.font=[UIFont systemFontOfSize:17];
    [erShuiView addSubview:label42];
    [label42 release];
    
    UILabel *label43=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45*2, 100, 21)];
    label43.text=@"住宅类型:";
    label43.textColor=DEEP_TEXT_COLOR;
    label43.font=[UIFont systemFontOfSize:17];
    [erShuiView addSubview:label43];
    [label43 release];
    
    UILabel *label44=[[UILabel alloc]initWithFrame:CGRectMake(20, 12+45*3, 100, 21)];
    label44.text=@"房产证年限:";
    label44.textColor=DEEP_TEXT_COLOR;
    label44.font=[UIFont systemFontOfSize:17];
    [erShuiView addSubview:label44];
    [label44 release];
    
    erMianjiText=[[UITextField alloc]initWithFrame:CGRectMake(100, 12, SCREEN_WIDTH-150, 21)];
    erMianjiText.placeholder=@"输入面积";
    erMianjiText.textAlignment=1;
    erMianjiText.textColor=DEEP_TEXT_COLOR;
    erMianjiText.font=[UIFont systemFontOfSize:17];
    erMianjiText.keyboardType=UIKeyboardTypeDecimalPad;
    [erShuiView addSubview:erMianjiText];
    [erMianjiText release];
    
    erDanText=[[UITextField alloc]initWithFrame:CGRectMake(100, 12+45, SCREEN_WIDTH-150, 21)];
    erDanText.placeholder=@"输入单价";
    erDanText.textAlignment=1;
    erDanText.textColor=DEEP_TEXT_COLOR;
    erDanText.keyboardType=UIKeyboardTypeDecimalPad;
    erDanText.font=[UIFont systemFontOfSize:17];
    [erShuiView addSubview:erDanText];
    [erDanText release];
    
    erputongL=[[UILabel alloc]initWithFrame:CGRectMake(100, 12+45*2, SCREEN_WIDTH-150, 21)];
    erputongL.text=@"普通住宅";
    erputongL.textAlignment=1;
    erputongL.textColor=DEEP_TEXT_COLOR;
    erputongL.font=[UIFont systemFontOfSize:17];
    [erShuiView addSubview:erputongL];
    [erputongL release];
    
    UIButton *erputongBtn=[[UIButton alloc]initWithFrame:CGRectMake(80, 7+45*2, SCREEN_WIDTH-90, 31)];
    [erputongBtn addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    erputongBtn.tag=21;
    [erShuiView addSubview:erputongBtn];
    [erputongBtn release];
    
    
    erNianL=[[UILabel alloc]initWithFrame:CGRectMake(100, 12+45*3, SCREEN_WIDTH-150, 21)];
    erNianL.text=@"不满两年";
    erNianL.textAlignment=1;
    erNianL.textColor=DEEP_TEXT_COLOR;
    erNianL.font=[UIFont systemFontOfSize:17];
    [erShuiView addSubview:erNianL];
    [erNianL release];
    
    UIButton *erNianBtn=[[UIButton alloc]initWithFrame:CGRectMake(80, 7+45*3, SCREEN_WIDTH-90, 31)];
    [erNianBtn addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    erNianBtn.tag=22;
    [erShuiView addSubview:erNianBtn];
    [erNianBtn release];
    
    UILabel *labelright11=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-40, 12, 40, 21)];
    labelright11.text=@"平米";
    labelright11.textColor=DEEP_TEXT_COLOR;
    labelright11.font=[UIFont systemFontOfSize:17];
    [erShuiView addSubview:labelright11];
    [labelright11 release];
    
    UILabel *labelright22=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-40, 12+45, 30, 21)];
    labelright22.text=@"元";
    labelright22.textColor=DEEP_TEXT_COLOR;
    labelright22.font=[UIFont systemFontOfSize:17];
    [erShuiView addSubview:labelright22];
    [labelright22 release];
    
    UIButton *rightBtn33=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-40, 12+45*2, 20, 20)];
    [rightBtn33 setImage:[UIImage imageNamed:@"down_arrow.png"] forState:UIControlStateNormal];
    [rightBtn33 addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    [erShuiView addSubview:rightBtn33];
    
    UIButton *rightBtn44=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-40, 12+45*3, 20, 20)];
    [rightBtn44 setImage:[UIImage imageNamed:@"down_arrow.png"] forState:UIControlStateNormal];
    [rightBtn44 addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    [erShuiView addSubview:rightBtn44];
    
    erleftBtn1=[[UIButton alloc]initWithFrame:CGRectMake(20, 185, 20, 20)];
    [erleftBtn1 setImage:[UIImage imageNamed:@"方未选.png"] forState:UIControlStateNormal];
    [erleftBtn1 setImage:[UIImage imageNamed:@"方选中.png"] forState:UIControlStateSelected];
    [erleftBtn1 addTarget:self action:@selector(selectLeftBtn:) forControlEvents:UIControlEventTouchUpInside];
    [erShuiView addSubview:erleftBtn1];
    
    erleftBtn2=[[UIButton alloc]initWithFrame:CGRectMake(20, 220, 20, 20)];
    [erleftBtn2 setImage:[UIImage imageNamed:@"方未选.png"] forState:UIControlStateNormal];
    [erleftBtn2 setImage:[UIImage imageNamed:@"方选中.png"] forState:UIControlStateSelected];
    [erleftBtn2 addTarget:self action:@selector(selectLeftBtn:) forControlEvents:UIControlEventTouchUpInside];
    [erShuiView addSubview:erleftBtn2];
    
    erleftBtn3=[[UIButton alloc]initWithFrame:CGRectMake(20, 255, 20, 20)];
    [erleftBtn3 setImage:[UIImage imageNamed:@"方未选.png"] forState:UIControlStateNormal];
    [erleftBtn3 setImage:[UIImage imageNamed:@"方选中.png"] forState:UIControlStateSelected];
    [erleftBtn3 addTarget:self action:@selector(selectLeftBtn:) forControlEvents:UIControlEventTouchUpInside];
    [erShuiView addSubview:erleftBtn3];
    
    erleftBtn1.selected=YES;
    erleftBtn2.selected=YES;
    erleftBtn3.selected=YES;
    
    UILabel *leftL1=[[UILabel alloc]initWithFrame:CGRectMake(45, 185, 150, 21)];
    leftL1.text=@"房产购置满两年";
    leftL1.textColor=DEEP_TEXT_COLOR;
    leftL1.font=[UIFont systemFontOfSize:17];
    [erShuiView addSubview:leftL1];
    [leftL1 release];
    
    UILabel *leftL2=[[UILabel alloc]initWithFrame:CGRectMake(45, 220, 150, 21)];
    leftL2.text=@"房产首次配置";
    leftL2.textColor=DEEP_TEXT_COLOR;
    leftL2.font=[UIFont systemFontOfSize:17];
    [erShuiView addSubview:leftL2];
    [leftL2 release];
    
    UILabel *leftL3=[[UILabel alloc]initWithFrame:CGRectMake(45, 255, 150, 21)];
    leftL3.text=@"卖方唯一购房";
    leftL3.textColor=DEEP_TEXT_COLOR;
    leftL3.font=[UIFont systemFontOfSize:17];
    [erShuiView addSubview:leftL3];
    [leftL3 release];
    
    for(int i=0;i<4;i++){
        UILabel *henglabel=[[UILabel alloc]initWithFrame:CGRectMake(0, i*45, SCREEN_WIDTH, 0.7)];
        henglabel.backgroundColor=LIGHT_BACK_COLOR;
        [newShuiView addSubview:henglabel];
    }
    
    for(int i=0;i<4;i++){
        UILabel *henglabel=[[UILabel alloc]initWithFrame:CGRectMake(0, i*45, SCREEN_WIDTH, 0.7)];
        henglabel.backgroundColor=LIGHT_BACK_COLOR;
        [erShuiView addSubview:henglabel];
    }
    
    UILabel *henglabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 285, SCREEN_WIDTH, 0.7)];
    henglabel.backgroundColor=LIGHT_BACK_COLOR;
    [erShuiView addSubview:henglabel];
    
    //添加按钮
    UIButton * shuiTwoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shuiTwoBtn.frame = CGRectMake(30, 295, SCREEN_WIDTH-60, 45);
    [shuiTwoBtn setTitle:@"开始计算" forState:UIControlStateNormal];
    [shuiTwoBtn setBackgroundColor:[UIColor colorWithRed:252/255.0 green:102/255.0 blue:40/255.0 alpha:100]];
    shuiTwoBtn.layer.masksToBounds=YES;
    shuiTwoBtn.layer.cornerRadius=5;
    [shuiTwoBtn addTarget:self action:@selector(jiSuanAction:) forControlEvents:UIControlEventTouchUpInside];
    [erShuiView addSubview:shuiTwoBtn];
 
    ShuiJisuanView.frame=CGRectMake(0,500,SCREEN_WIDTH,400);
    ShuiJisuanView.hidden=YES;
}

-(IBAction)newShuiAction:(id)sender{
    [erBtn setTitleColor:[UIColor colorWithRed:252/255.0 green:102/255.0 blue:40/255.0 alpha:100] forState:UIControlStateNormal];
    erBtn.backgroundColor=LIGHT_BACK_COLOR;
    [newBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    newBtn.backgroundColor=AliRedColor;
    newShuiView.hidden=NO;
    erShuiView.hidden=YES;
    huanKuanType=@"新房";
    ShuiJisuanView.hidden=YES;
}

-(IBAction)erShuiAction:(id)sender{
    [newBtn setTitleColor:[UIColor colorWithRed:252/255.0 green:102/255.0 blue:40/255.0 alpha:100] forState:UIControlStateNormal];
    newBtn.backgroundColor=LIGHT_BACK_COLOR;
    [erBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    erBtn.backgroundColor=AliRedColor;
    erShuiView.hidden=NO;
    newShuiView.hidden=YES;
    huanKuanType=@"二手房";
    ShuiJisuanView.hidden=YES;
}

-(IBAction)weiyi1Action:(id)sender{
    weiyiBtn1.selected=YES;
    weiyiBtn2.selected=NO;
}

-(IBAction)weiyi2Action:(id)sender{
    weiyiBtn1.selected=NO;
    weiyiBtn2.selected=YES;
}

-(IBAction)selectLeftBtn:(id)sender{
    UIButton *btn=sender;
    if(btn.selected){
        btn.selected=NO;
    }
    else{
        btn.selected=YES;
    }
}



#pragma mark ----------弹出视图按钮事件----------
-(void)chooseAction:(UIButton *)btn
{
    //zhangyg + 重置字符串
    xianString=@"";
    //回收键盘
    [self closeKeyBoad];
    switch (btn.tag) {
        case 1:
        {
            if (tabArray.count>0) {
                [tabArray removeAllObjects];
                [tabArray addObjectsFromArray:array_1];
            }
            else{
                [tabArray addObjectsFromArray:array_1];
            }
            popType = @"商贷按揭成数";
            popLabel.text = @"按揭成数";
            [popTableView reloadData];
            [popTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                atScrollPosition:UITableViewScrollPositionTop
                                        animated:NO];
        }
            break;
        case 2:
        {
            if (tabArray.count>0) {
                [tabArray removeAllObjects];
                [tabArray addObjectsFromArray:array_2];
            }
            else{
                [tabArray addObjectsFromArray:array_2];
            }
            popType = @"商贷按揭年数";
            popLabel.text = @"按揭年数";
            [popTableView reloadData];
            [popTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:19 inSection:0]
                                atScrollPosition:UITableViewScrollPositionTop
                                        animated:NO];
            
        }
            break;
        case 3:
        {
            if (tabArray.count>0) {
                [tabArray removeAllObjects];
                [tabArray addObjectsFromArray:array_3];
            }
            else{
                [tabArray addObjectsFromArray:array_3];
            }
            popType = @"商贷按揭利率";
            popLabel.text = @"按揭利率";
            [popTableView reloadData];
            [popTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                atScrollPosition:UITableViewScrollPositionTop
                                        animated:NO];
            
        }
            break;
        case 4:
        {
            if (tabArray.count>0) {
                [tabArray removeAllObjects];
                [tabArray addObjectsFromArray:array_2];
            }
            else{
                [tabArray addObjectsFromArray:array_2];
            }
            popType = @"商贷总价按揭年数";
            popLabel.text = @"按揭年数";
            [popTableView reloadData];
            [popTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:19 inSection:0]
                                atScrollPosition:UITableViewScrollPositionTop
                                        animated:NO];
            
        }
            break;
        case 5:
        {
            if (tabArray.count>0) {
                [tabArray removeAllObjects];
                [tabArray addObjectsFromArray:array_3];
            }
            else{
                [tabArray addObjectsFromArray:array_3];
            }
            popType = @"商贷总价按揭利率";
            popLabel.text = @"按揭利率";
            [popTableView reloadData];
            [popTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                atScrollPosition:UITableViewScrollPositionTop
                                        animated:NO];
            
        }
            break;
        case 6:
        {
            if (tabArray.count>0) {
                [tabArray removeAllObjects];
                [tabArray addObjectsFromArray:array_1];
            }
            else{
                [tabArray addObjectsFromArray:array_1];
            }
            popType = @"公积金按揭成数";
            popLabel.text = @"按揭成数";
            [popTableView reloadData];
            [popTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                atScrollPosition:UITableViewScrollPositionTop
                                        animated:NO];
            
        }
            break;
        case 7:
        {
            if (tabArray.count>0) {
                [tabArray removeAllObjects];
                [tabArray addObjectsFromArray:array_2];
            }
            else{
                [tabArray addObjectsFromArray:array_2];
            }
            popType = @"公积金按揭年数";
            popLabel.text = @"按揭年数";
            [popTableView reloadData];
            [popTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:19 inSection:0]
                                atScrollPosition:UITableViewScrollPositionTop
                                        animated:NO];
            
        }
            break;
        case 8:
        {
            if (tabArray.count>0) {
                [tabArray removeAllObjects];
                [tabArray addObjectsFromArray:array_3];
            }
            else{
                [tabArray addObjectsFromArray:array_3];
            }
            popType = @"公积金按揭利率";
            popLabel.text = @"按揭利率";
            [popTableView reloadData];
            [popTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                atScrollPosition:UITableViewScrollPositionTop
                                        animated:NO];
            
        }
            break;
        case 9:
        {
            if (tabArray.count>0) {
                [tabArray removeAllObjects];
                [tabArray addObjectsFromArray:array_2];
            }
            else{
                [tabArray addObjectsFromArray:array_2];
            }
            popType = @"公积金总价按揭年数";
            popLabel.text = @"按揭年数";
            [popTableView reloadData];
            [popTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:19 inSection:0]
                                atScrollPosition:UITableViewScrollPositionTop
                                        animated:NO];
            
        }
            break;
        case 10:
        {
            if (tabArray.count>0) {
                [tabArray removeAllObjects];
                [tabArray addObjectsFromArray:array_3];
            }
            else{
                [tabArray addObjectsFromArray:array_3];
            }
            popType = @"公积金总价按揭利率";
            popLabel.text = @"按揭利率";
            [popTableView reloadData];
            [popTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                atScrollPosition:UITableViewScrollPositionTop
                                        animated:NO];
            
        }
            break;
        case 11:
        {
            if (tabArray.count>0) {
                [tabArray removeAllObjects];
                [tabArray addObjectsFromArray:array_2];
            }
            else{
                [tabArray addObjectsFromArray:array_2];
            }
            popType = @"组合型按揭年数";
            popLabel.text = @"按揭年数";
            [popTableView reloadData];
            [popTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:19 inSection:0]
                                atScrollPosition:UITableViewScrollPositionTop
                                        animated:NO];
            
        }
            break;
        case 12:
        {
            if (tabArray.count>0) {
                [tabArray removeAllObjects];
                [tabArray addObjectsFromArray:array_3];
            }
            else{
                [tabArray addObjectsFromArray:array_3];
            }
            popType = @"组合型按揭利率";
            popLabel.text = @"按揭利率";
            [popTableView reloadData];
            [popTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                atScrollPosition:UITableViewScrollPositionTop
                                        animated:NO];
            
        }
            break;
            
        case 21:
        {
            if (tabArray.count>0) {
                [tabArray removeAllObjects];
                [tabArray addObjectsFromArray:array_7];
            }
            else{
                [tabArray addObjectsFromArray:array_7];
            }
            popType = @"住宅类型";
            popLabel.text = @"住宅类型";
            [popTableView reloadData];
            [popTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                atScrollPosition:UITableViewScrollPositionTop
                                        animated:NO];
            
        }
            break;
        case 22:
        {
            if (tabArray.count>0) {
                [tabArray removeAllObjects];
                [tabArray addObjectsFromArray:array_8];
            }
            else{
                [tabArray addObjectsFromArray:array_8];
            }
            popType = @"房产证年限";
            popLabel.text = @"房产证年限";
            [popTableView reloadData];
            [popTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                atScrollPosition:UITableViewScrollPositionTop
                                        animated:NO];
            
        }
            break;
        default:
            break;
    }
    
    popIMgview.hidden = NO;
    coverView.hidden = NO;
}

#pragma mark - XYPieChart Data Source

- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart
{
    return slices.count;
}

- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return [[slices objectAtIndex:index] intValue];
}

- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index
{
    return [sliceColors objectAtIndex:(index % sliceColors.count)];
}

#pragma mark - XYPieChart Delegate
- (void)pieChart:(XYPieChart *)pieChart didSelectSliceAtIndex:(NSUInteger)index
{
    
    
}

#pragma mark ------------按钮事件------------
//商贷按钮事件
-(void)shangAction:(UIButton *)btn
{
    [UIView animateWithDuration:0.3 animations:^
     {
         feilabel.frame = CGRectMake(0,57, SCREEN_WIDTH/4,5);
     } completion:^(BOOL finished)
     {
     }];
    shangDaiBtn.selected = YES;
    gongBtn.selected = NO;
    zuHeBtn.selected = NO;
    shangDaiView.hidden = NO;
    gongView.hidden = YES;
    zuHeView.hidden = YES;
    shuifeiView.hidden=YES;
    jiSuanType = @"商业贷款";
    jisuanView.hidden=YES;
    shangDanBtn.selected = YES;
    shangZongBtn.selected = NO;
    userContentView.contentSize = CGSizeMake(SCREEN_WIDTH, 530);
    huanKuanType=@"等额本息";
    suanType = @"单价计算";
    
    //回收键盘
    [gongJiaGe resignFirstResponder];
    [gongMianJi resignFirstResponder];
    [gongZong resignFirstResponder];
    [gongDai resignFirstResponder];
    [shangDai resignFirstResponder];
}
//公积金按钮事件
-(void)gongAction:(UIButton *)btn
{
    [UIView animateWithDuration:0.3 animations:^
     {
         feilabel.frame = CGRectMake(SCREEN_WIDTH/4,57, SCREEN_WIDTH/4,5);
     } completion:^(BOOL finished)
     {
     }];
    gongBtn.selected = YES;
    shangDaiBtn.selected = NO;
    zuHeBtn.selected = NO;
    gongView.hidden = NO;
    shangDaiView.hidden = YES;
    zuHeView.hidden = YES;
    shuifeiView.hidden=YES;
    jiSuanType = @"公积金贷款";
    jisuanView.hidden=YES;
    shangDanBtn.selected = YES;
    shangZongBtn.selected = NO;
    userContentView.contentSize = CGSizeMake(SCREEN_WIDTH, 530);
    huanKuanType=@"等额本息";
    suanType = @"单价计算";
    
    //回收键盘
    [shangJiaGe resignFirstResponder];
    [shangMianJi resignFirstResponder];
    [shangZong resignFirstResponder];
    [gongDai resignFirstResponder];
    [shangDai resignFirstResponder];
}
//组合型按钮事件
-(void)zuHeAction:(UIButton *)btn
{
    [UIView animateWithDuration:0.3 animations:^
     {
         feilabel.frame = CGRectMake(2*SCREEN_WIDTH/4,57, SCREEN_WIDTH/4,5);
     } completion:^(BOOL finished)
     {
     }];
    zuHeBtn.selected = YES;
    shangDaiBtn.selected = NO;
    gongBtn.selected = NO;
    zuHeView.hidden = NO;
    shangDaiView.hidden = YES;
    gongView.hidden = YES;
    shuifeiView.hidden=YES;
    jiSuanType = @"组合型贷款";
    jisuanView.hidden=YES;
    shangDanBtn.selected = YES;
    shangZongBtn.selected = NO;
    userContentView.contentSize = CGSizeMake(SCREEN_WIDTH, 530);
    huanKuanType=@"等额本息";
    suanType = @"单价计算";
    
    //回收键盘
    [shangJiaGe resignFirstResponder];
    [shangMianJi resignFirstResponder];
    [shangZong resignFirstResponder];
    [gongJiaGe resignFirstResponder];
    [gongMianJi resignFirstResponder];
    [gongZong resignFirstResponder];
}

//税费计算按钮事件
-(void)shuifeiAction:(UIButton *)btn
{
    [UIView animateWithDuration:0.3 animations:^
     {
         feilabel.frame = CGRectMake(3*SCREEN_WIDTH/4,57, SCREEN_WIDTH/4,5);
     } completion:^(BOOL finished)
     {
     }];
    huanKuanType=@"新房";
    zuHeBtn.selected = YES;
    shangDaiBtn.selected = NO;
    gongBtn.selected = NO;
    zuHeView.hidden = YES;
    shangDaiView.hidden = YES;
    gongView.hidden = YES;
    shuifeiView.hidden=NO;
    jiSuanType = @"税费计算";
    jisuanView.hidden=YES;
    userContentView.contentSize = CGSizeMake(SCREEN_WIDTH, 530);
    //回收键盘
    [shangJiaGe resignFirstResponder];
    [shangMianJi resignFirstResponder];
    [shangZong resignFirstResponder];
    [gongJiaGe resignFirstResponder];
    [gongMianJi resignFirstResponder];
    [gongZong resignFirstResponder];
}
//还款类型
-(void)oneBtnAction:(UIButton *)btn
{
    oneBtn.selected = YES;
    twoBtn.selected = NO;
    huanKuanType = @"等额本息";
}
-(void)twoBtnAction:(UIButton *)btn
{
    twoBtn.selected = YES;
    oneBtn.selected = NO;
    huanKuanType = @"等额本金";
}

-(IBAction)tabhuanKuanType:(id)sender{
    if(sender==benxiBtn){
        benxiBtn.backgroundColor=AliRedColor;
        [benxiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        benjinBtn.backgroundColor=LIGHT2_BACK_COLOR;
        [benjinBtn setTitleColor:[UIColor colorWithRed:252/255.0 green:102/255.0 blue:40/255.0 alpha:100] forState:UIControlStateNormal];
        huanKuanType=@"等额本息";
        huankuanLabel.text=@"每月还款额固定，所还总利息较多，适合收入稳定者";
        [self jiSuanAction:nil];
    }
    if(sender==benjinBtn){
        benjinBtn.backgroundColor=AliRedColor;
        [benjinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        benxiBtn.backgroundColor=LIGHT2_BACK_COLOR;
        [benxiBtn setTitleColor:[UIColor colorWithRed:252/255.0 green:102/255.0 blue:40/255.0 alpha:100] forState:UIControlStateNormal];
        huanKuanType=@"等额本金";
        huankuanLabel.text=@"每月还款额递减，所还总利息较低，前期还款额较大";
        [self jiSuanAction:nil];
    }
}

//计算结果
-(void)jiSuanAction:(UIButton *)btn
{
    
    NSString * resultType;
    if ([jiSuanType isEqualToString:@"组合型贷款"]) {
        resultType = [NSString stringWithFormat:@"%@%@",jiSuanType,huanKuanType];
    }
    else{
        resultType = [NSString stringWithFormat:@"%@%@%@",jiSuanType,huanKuanType,suanType];
    }
    /*
     * 商业贷款数据的计算
     */
    if ([resultType isEqualToString:@"商业贷款等额本息单价计算"]) {
        if (shangJiaGe.text.length==0 && shangMianJi.text.length>0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入单价" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else if (shangMianJi.text.length==0 && shangJiaGe.text.length>0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入房屋面积" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else if (shangJiaGe.text.length==0 && shangMianJi.text.length==0){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入单价" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else{
            userContentView.contentSize = CGSizeMake(SCREEN_WIDTH, 530+SCREEN_HEIGHT);
            jisuanView.hidden=NO;
            ShuiJisuanView.hidden=YES;
            CGPoint position = CGPointMake(0, 450);
            [userContentView setContentOffset:position animated:YES];
            
            float jiaGe = [shangJiaGe.text floatValue];//单价
            float mianJi = [shangMianJi.text floatValue];//面积
            int nian = [[array_6 objectAtIndex:[array_2 indexOfObject:shangDanNian.text]] intValue];
            float cheng = [[shangDanCheng.text substringWithRange:NSMakeRange(0, 1)] floatValue]/10;
            float liLv = [label_1.text floatValue]/100;//利率
            float zongJia = jiaGe * mianJi;//房屋总价
            float daiKuan = zongJia *(1-cheng);//贷款总额
            float shouYue = zongJia-daiKuan;//首月还款
            int yueShu = nian*12;//贷款月数
            float yueLilv = liLv/12;
            float yueHuan = daiKuan*yueLilv*powf(1+yueLilv, yueShu)/(powf(1+yueLilv, yueShu)-1);//每月还款
            float zongHuan = yueHuan*yueShu;//还款总额
            float huanLi = zongHuan-daiKuan;//支付利息
            NSArray * array1 = [NSArray arrayWithObjects:@"房款总额",@"贷款总额",@"还款总额",@"支付利息",@"首付金额",@"贷款月数",@"月均还款", @"月利率",nil];
            NSString * str1 = [NSString stringWithFormat:@"%.0f 元",zongJia];
            NSString * str2 = [NSString stringWithFormat:@"%.0f 元",daiKuan];
            NSString * str3 = [NSString stringWithFormat:@"%.0f 元",zongHuan];
            NSString * str4 = [NSString stringWithFormat:@"%.0f 元",huanLi];
            NSString * str5 = [NSString stringWithFormat:@"%.0f 元",shouYue];
            NSString * str6 = [NSString stringWithFormat:@"%d 月",yueShu];
            NSString * str7 = [NSString stringWithFormat:@"%.2f 元",yueHuan];
            NSString * str8 = label_1.text;
            NSArray * array2 = [NSArray arrayWithObjects:str1,str2,str3,str4,str5,str6,str7,str8, nil];
            
            [self reloadJisuanResult:array2 type:@"1"];
//            FangResultViewController * fvc = [[FangResultViewController alloc]init];
//            fvc.nameArray_1 = array1;
//            fvc.dataArray_1 = array2;
//            fvc.xianType = @"1";
//            [self.navigationController pushViewController:fvc animated:YES];
//            [fvc release];
        }
    }
    if ([resultType isEqualToString:@"商业贷款等额本金单价计算"]) {
        if (shangJiaGe.text.length==0 && shangMianJi.text.length>0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入单价" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else if (shangMianJi.text.length==0 && shangJiaGe.text.length>0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入房屋面积" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else if (shangJiaGe.text.length==0 && shangMianJi.text.length==0){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入单价" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else{
            userContentView.contentSize = CGSizeMake(SCREEN_WIDTH, 530+SCREEN_HEIGHT);
            jisuanView.hidden=NO;
            ShuiJisuanView.hidden=YES;
            CGPoint position = CGPointMake(0, 450);
            [userContentView setContentOffset:position animated:YES];
            //每月还款数组
            NSMutableArray * array4 = [[NSMutableArray alloc]initWithCapacity:0];
            //月数数组
            NSMutableArray * array3 = [[NSMutableArray alloc]initWithCapacity:0];
            float jiaGe = [shangJiaGe.text floatValue];//单价
            float mianJi = [shangMianJi.text floatValue];//面积
            int nian = [[array_6 objectAtIndex:[array_2 indexOfObject:shangDanNian.text]] intValue];
            int yueShu = nian*12;//贷款月数
            float cheng = [[shangDanCheng.text substringWithRange:NSMakeRange(0, 1)] floatValue]/10;
            float liLv = [label_1.text floatValue]/100;//利率
            float yueJun = jiaGe*mianJi*(1-cheng)/(nian*12);//每月所还本金
            float yueLilv = liLv/12;//月利率
            float zongJia = jiaGe*mianJi;//房款总额
            float daiZong = zongJia*cheng;//贷款总额
            float zongHuan = 0.0;//还款总额
            float yueHuan0=0;
            for (int i=0; i<nian*12; i++) {
                
                float yueHuan = yueJun+(jiaGe*mianJi*cheng-yueJun*i)*yueLilv;
                if(i==0){
                    yueHuan0=yueHuan;
                }
                NSString * strKuan = [NSString stringWithFormat:@"%.2f 元",yueHuan];
                NSString * strYue = [NSString stringWithFormat:@"第%d月",i+1];
                [array4 addObject:strKuan];
                [array3 addObject:strYue];
                zongHuan+=yueHuan;
            }
            
            float zhiLi = zongHuan-daiZong;//支付利息
            float shouFu = zongJia-daiZong;//首期付款
            
            float shouFu1=zongJia*cheng; //首付
            daiZong=zongJia*(1-cheng); //贷款总额
            zongHuan=daiZong+zhiLi;
            NSArray * array1 = [NSArray arrayWithObjects:@"房款总额",@"贷款总额",@"还款总额",@"支付利息",@"首付金额",@"还款月数", nil];
            NSString * str1 = [NSString stringWithFormat:@"%.0f 元",zongJia];//总价
            NSString * str2 = [NSString stringWithFormat:@"%.0f 元",daiZong]; //贷款
            NSString * str3 = [NSString stringWithFormat:@"%.0f 元",zongHuan]; //还款
            NSString * str4 = [NSString stringWithFormat:@"%.0f 元",zhiLi]; //利息
            NSString * str5 = [NSString stringWithFormat:@"%.0f 元",shouFu1]; //首付
            NSString * str6 = [NSString stringWithFormat:@"%d 月",yueShu]; //首月
            NSString * str7 = [NSString stringWithFormat:@"%.2f 元",yueHuan0]; //月均还款
            NSString * str8 = label_1.text;
            NSArray * array2 = [NSArray arrayWithObjects:str1,str2,str3,str4,str5,str6,str7,str8, nil];
            
            [self reloadJisuanResult:array2 type:@"1"];
 
        }
    }
    if ([resultType isEqualToString:@"商业贷款等额本息总价计算"]) {
        if (shangZong.text.length==0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入贷款总额" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else{
            userContentView.contentSize = CGSizeMake(SCREEN_WIDTH, 530+SCREEN_HEIGHT);
            jisuanView.hidden=NO;
            ShuiJisuanView.hidden=YES;
            CGPoint position = CGPointMake(0, 450);
            [userContentView setContentOffset:position animated:YES];
            float daiZong = [shangZong.text floatValue]*10000;//贷款总额
            int yueShu = [[array_6 objectAtIndex:[array_2 indexOfObject:shangZongNian.text]] intValue]*12;//贷款月数
            float liLv = [label_2.text floatValue]/100;//利率
            float yueLilv = liLv/12;//月利率
            float yueHuan = daiZong*yueLilv*powf(1+yueLilv, yueShu)/(powf(1+yueLilv, yueShu)-1);//每月还款
            float zongHuan = yueHuan * yueShu;//还款总额
            float huanLi = zongHuan-daiZong;//支付利息

            NSArray * array1 = [NSArray arrayWithObjects:@"贷款总额",@"还款总额",@"支付利息",@"贷款月数",@"月均还款", nil];
            NSString * str1 = [NSString stringWithFormat:@"%.0f 元",daiZong];
            NSString * str2 = [NSString stringWithFormat:@"%.0f 元",zongHuan];
            NSString * str3 = [NSString stringWithFormat:@"%.0f 元",huanLi];
            NSString * str4 = [NSString stringWithFormat:@"%d 月",yueShu];
            NSString * str5 = [NSString stringWithFormat:@"%.2f 元",yueHuan];
            NSString * str6 = label_2.text;
            
            NSArray * array2 = [NSArray arrayWithObjects:str1,str2,str3,str4,str5,str6, nil];
 
            [self reloadJisuanResult:array2 type:@"2"];
        }
    }
    if ([resultType isEqualToString:@"商业贷款等额本金总价计算"]) {
        if (shangZong.text.length==0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入贷款总额" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else{
            userContentView.contentSize = CGSizeMake(SCREEN_WIDTH, 530+SCREEN_HEIGHT);
            jisuanView.hidden=NO;
            ShuiJisuanView.hidden=YES;
            CGPoint position = CGPointMake(0, 450);
            [userContentView setContentOffset:position animated:YES];
            //每月还款数组
            NSMutableArray * array4 = [[NSMutableArray alloc]initWithCapacity:0];
            //月数数组
            NSMutableArray * array3 = [[NSMutableArray alloc]initWithCapacity:0];
            float daiZong = [shangZong.text floatValue]*10000;//贷款总额
            int yueShu = [[array_6 objectAtIndex:[array_2 indexOfObject:shangZongNian.text]] intValue]*12;//贷款月数
            float liLv = [label_2.text floatValue]/100;//利率
            float yueLilv = liLv/12;//月利率
            float yueJun = daiZong/yueShu;//月还本金
            float zongHuan = 0.0;//还款总额
            float yueHuan0=0;
            for (int i=0; i<yueShu; i++) {
                float yueHuan = yueJun+(daiZong-yueJun*i)*yueLilv;
                if(i==0){
                    yueHuan0=yueHuan;
                }
                NSString * strKuan = [NSString stringWithFormat:@"%.2f 元",yueHuan];
                NSString * strYue = [NSString stringWithFormat:@"第%d月",i+1];
                [array4 addObject:strKuan];
                [array3 addObject:strYue];
                zongHuan+=yueHuan;
            }
            float zhiLi = zongHuan-daiZong;//支付利息
            NSArray * array1 = [NSArray arrayWithObjects:@"贷款总额",@"还款总额",@"支付利息",@"贷款月数", nil];
            NSString * str1 = [NSString stringWithFormat:@"%.0f 元",daiZong];
            NSString * str2 = [NSString stringWithFormat:@"%.0f 元",zongHuan];
            NSString * str3 = [NSString stringWithFormat:@"%.0f 元",zhiLi];
            NSString * str4 = [NSString stringWithFormat:@"%d 月",yueShu];
            NSString * str5 = [NSString stringWithFormat:@"%.2f 元",yueHuan0];
            NSString * str6 = label_2.text;
            NSArray * array2 = [NSArray arrayWithObjects:str1,str2,str3,str4,str5,str6, nil];
            
            [self reloadJisuanResult:array2 type:@"2"];
        }
    }
    /*
     * 公积金贷款数据的计算
     */
    if ([resultType isEqualToString:@"公积金贷款等额本息单价计算"]) {
        if (gongJiaGe.text.length==0 && gongMianJi.text.length>0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入单价" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else if (gongMianJi.text.length==0 && gongJiaGe.text.length>0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入房屋面积" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else if (gongJiaGe.text.length==0 && gongMianJi.text.length==0){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入单价" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else{
            userContentView.contentSize = CGSizeMake(SCREEN_WIDTH, 530+SCREEN_HEIGHT);
            jisuanView.hidden=NO;
            ShuiJisuanView.hidden=YES;
            CGPoint position = CGPointMake(0, 450);
            [userContentView setContentOffset:position animated:YES];
            
            float jiaGe = [gongJiaGe.text floatValue];//单价
            float mianJi = [gongMianJi.text floatValue];//面积
            int nian = [[array_6 objectAtIndex:[array_2 indexOfObject:gongDanNian.text]] intValue];
            float cheng = [[gongDanCheng.text substringWithRange:NSMakeRange(0, 1)] floatValue]/10;
            float liLv = [label_3.text floatValue]/100;//利率
            float zongJia = jiaGe * mianJi;//房屋总价
            float daiKuan = zongJia * (1-cheng);//贷款总额
            float shouYue = zongJia-daiKuan;//首月还款
            int yueShu = nian*12;//贷款月数
            float yueLilv = liLv/12;
            float yueHuan = daiKuan*yueLilv*powf(1+yueLilv, yueShu)/(powf(1+yueLilv, yueShu)-1);//每月还款
            float zongHuan = yueHuan*yueShu;//还款总额
            float huanLi = zongHuan-daiKuan;//支付利息
            NSArray * array1 = [NSArray arrayWithObjects:@"房款总额",@"贷款总额",@"还款总额",@"支付利息",@"首月还款",@"贷款月数",@"月均还款", nil];
            NSString * str1 = [NSString stringWithFormat:@"%.0f 元",zongJia];
            NSString * str2 = [NSString stringWithFormat:@"%.0f 元",daiKuan];
            NSString * str3 = [NSString stringWithFormat:@"%.0f 元",zongHuan];
            NSString * str4 = [NSString stringWithFormat:@"%.0f 元",huanLi];
            NSString * str5 = [NSString stringWithFormat:@"%.0f 元",shouYue];
            NSString * str6 = [NSString stringWithFormat:@"%d 月",yueShu];
            NSString * str7 = [NSString stringWithFormat:@"%.2f 元",yueHuan];
            NSString * str8 = label_3.text;
            NSArray * array2 = [NSArray arrayWithObjects:str1,str2,str3,str4,str5,str6,str7,str8, nil];
            
            [self reloadJisuanResult:array2 type:@"1"];
        }
    }
    if ([resultType isEqualToString:@"公积金贷款等额本金单价计算"]) {
        if (gongJiaGe.text.length==0 && gongMianJi.text.length>0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入单价" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else if (gongMianJi.text.length==0 && gongJiaGe.text.length>0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入房屋面积" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else if (gongJiaGe.text.length==0 && gongMianJi.text.length==0){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入单价" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else{
            userContentView.contentSize = CGSizeMake(SCREEN_WIDTH, 530+SCREEN_HEIGHT);
            jisuanView.hidden=NO;
            ShuiJisuanView.hidden=YES;
            CGPoint position = CGPointMake(0, 450);
            [userContentView setContentOffset:position animated:YES];
            
            //每月还款数组
            NSMutableArray * array4 = [[NSMutableArray alloc]initWithCapacity:0];
            //月数数组
            NSMutableArray * array3 = [[NSMutableArray alloc]initWithCapacity:0];
            float jiaGe = [gongJiaGe.text floatValue];//单价
            float mianJi = [gongMianJi.text floatValue];//面积
            int nian = [[array_6 objectAtIndex:[array_2 indexOfObject:gongDanNian.text]] intValue];
            int yueShu = nian*12;//贷款月数
            float cheng = [[gongDanCheng.text substringWithRange:NSMakeRange(0, 1)] floatValue]/10;
            float liLv = [label_3.text floatValue]/100;//利率
            float yueJun = jiaGe*mianJi*(1-cheng)/(nian*12);//每月所还本金
            float yueLilv = liLv/12;//月利率
            float zongJia = jiaGe*mianJi;//房款总额
            float daiZong = zongJia*(1-cheng);//贷款总额
            float zongHuan = 0.0;//还款总额
            float yueHuan0=0;
            for (int i=0; i<nian*12; i++) {
                float yueHuan = yueJun+(jiaGe*mianJi*(1-cheng)-yueJun*i)*yueLilv;
                if(i==0){
                    yueHuan0=yueHuan;
                }
                NSString * strKuan = [NSString stringWithFormat:@"%.2f 元",yueHuan];
                NSString * strYue = [NSString stringWithFormat:@"第%d月",i+1];
                [array4 addObject:strKuan];
                [array3 addObject:strYue];
                zongHuan+=yueHuan;
            }
            float zhiLi = zongHuan-daiZong;//支付利息
            float shouFu = zongJia-daiZong;//首期付款
            NSArray * array1 = [NSArray arrayWithObjects:@"房款总额",@"贷款总额",@"还款总额",@"支付利息",@"首期付款",@"还款月数", nil];
            NSString * str1 = [NSString stringWithFormat:@"%.0f 元",zongJia];
            NSString * str2 = [NSString stringWithFormat:@"%.0f 元",daiZong];
            NSString * str3 = [NSString stringWithFormat:@"%.0f 元",zongHuan];
            NSString * str4 = [NSString stringWithFormat:@"%.0f 元",zhiLi];
            NSString * str5 = [NSString stringWithFormat:@"%.0f 元",shouFu];
            NSString * str6 = [NSString stringWithFormat:@"%d 月",yueShu];
            NSString * str7 = [NSString stringWithFormat:@"%.2f 元",yueHuan0];
            NSString * str8 = label_3.text;
            NSArray * array2 = [NSArray arrayWithObjects:str1,str2,str3,str4,str5,str6,str7,str8, nil];
            [self reloadJisuanResult:array2 type:@"1"];
        }
    }
    if ([resultType isEqualToString:@"公积金贷款等额本息总价计算"]) {
        if (gongZong.text.length==0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入贷款总额" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else{
            userContentView.contentSize = CGSizeMake(SCREEN_WIDTH, 530+SCREEN_HEIGHT);
            jisuanView.hidden=NO;
            ShuiJisuanView.hidden=YES;
            CGPoint position = CGPointMake(0, 450);
            [userContentView setContentOffset:position animated:YES];
            
            float daiZong = [gongZong.text floatValue]*10000;//贷款总额
            int yueShu = [[array_6 objectAtIndex:[array_2 indexOfObject:gongZongNian.text]] intValue]*12;//贷款月数
            float liLv = [label_4.text floatValue]/100;//利率
            float yueLilv = liLv/12;//月利率
            float yueHuan = daiZong*yueLilv*powf(1+yueLilv, yueShu)/(powf(1+yueLilv, yueShu)-1);//每月还款
            float zongHuan = yueHuan * yueShu;//还款总额
            float huanLi = zongHuan-daiZong;//支付利息
            NSArray * array1 = [NSArray arrayWithObjects:@"贷款总额",@"还款总额",@"支付利息",@"贷款月数",@"月均还款", nil];
            NSString * str1 = [NSString stringWithFormat:@"%.0f 元",daiZong];
            NSString * str2 = [NSString stringWithFormat:@"%.0f 元",zongHuan];
            NSString * str3 = [NSString stringWithFormat:@"%.0f 元",huanLi];
            NSString * str4 = [NSString stringWithFormat:@"%d 月",yueShu];
            NSString * str5 = [NSString stringWithFormat:@"%.2f 元",yueHuan];
            NSString * str6=label_4.text;
            NSArray * array2 = [NSArray arrayWithObjects:str1,str2,str3,str4,str5, str6,nil];
            
            [self reloadJisuanResult:array2 type:@"2"];
            
        }
    }
    if ([resultType isEqualToString:@"公积金贷款等额本金总价计算"]) {
        if (gongZong.text.length==0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入贷款总额" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else{
            userContentView.contentSize = CGSizeMake(SCREEN_WIDTH, 530+SCREEN_HEIGHT);
            jisuanView.hidden=NO;
            ShuiJisuanView.hidden=YES;
            CGPoint position = CGPointMake(0, 450);
            [userContentView setContentOffset:position animated:YES];
            //每月还款数组
            NSMutableArray * array4 = [[NSMutableArray alloc]initWithCapacity:0];
            //月数数组
            NSMutableArray * array3 = [[NSMutableArray alloc]initWithCapacity:0];
            float daiZong = [gongZong.text floatValue]*10000;//贷款总额
            int yueShu = [[array_6 objectAtIndex:[array_2 indexOfObject:gongZongNian.text]] intValue]*12;//贷款月数
            float liLv = [label_4.text floatValue]/100;//利率
            float yueLilv = liLv/12;//月利率
            float yueJun = daiZong/yueShu;//月还本金
            float zongHuan = 0.0;//还款总额
            float yueHuan0=0;
            for (int i=0; i<yueShu; i++) {
                float yueHuan = yueJun+(daiZong-yueJun*i)*yueLilv;
                if(i==0){
                    yueHuan0=yueHuan;
                }
                NSString * strKuan = [NSString stringWithFormat:@"%.2f 元",yueHuan];
                NSString * strYue = [NSString stringWithFormat:@"第%d月",i+1];
                [array4 addObject:strKuan];
                [array3 addObject:strYue];
                zongHuan+=yueHuan;
            }
            float zhiLi = zongHuan-daiZong;//支付利息
            NSArray * array1 = [NSArray arrayWithObjects:@"贷款总额",@"还款总额",@"支付利息",@"贷款月数", nil];
            NSString * str1 = [NSString stringWithFormat:@"%.0f 元",daiZong];
            NSString * str2 = [NSString stringWithFormat:@"%.0f 元",zongHuan];
            NSString * str3 = [NSString stringWithFormat:@"%.0f 元",zhiLi];
            NSString * str4 = [NSString stringWithFormat:@"%d 月",yueShu];
            NSString * str5 = [NSString stringWithFormat:@"%.2f 元",yueHuan0];
            NSString * str6 = label_4.text;
            NSArray * array2 = [NSArray arrayWithObjects:str1,str2,str3,str4,str5,str6, nil];
            [self reloadJisuanResult:array2 type:@"2"];
        }
    }
    /*
     * 组合型贷款数据的计算
     */
    if ([resultType isEqualToString:@"组合型贷款等额本息"]) {
        if (gongDai.text.length==0 && shangDai.text.length>0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入公积金贷款总额" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else if (shangDai.text.length==0 && gongDai.text.length>0){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入商业贷款总额" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else if (gongDai.text.length==0 && shangDai.text.length==0){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入公积金贷款总额" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else{
            userContentView.contentSize = CGSizeMake(SCREEN_WIDTH, 530+SCREEN_HEIGHT);
            jisuanView.hidden=NO;
            ShuiJisuanView.hidden=YES;
            CGPoint position = CGPointMake(0, 450);
            [userContentView setContentOffset:position animated:YES];
            
            float gongKuan = [gongDai.text floatValue]*10000;//公积金贷款
            float shangKuan = [shangDai.text floatValue]*10000;//商业贷款
            int yueShu = [[array_6 objectAtIndex:[array_2 indexOfObject:zuHeNian.text]] intValue]*12;//贷款月数
            //字符串替换
            NSString * gongStr = label_5.text;
            NSString * shangStr = label_6.text;
            NSString * tem1 = @"公积金贷款利率";
            NSString * tem2 = @"商业贷款利率";
            NSString * replace = @"";
            NSRange rang1 = [gongStr rangeOfString:tem1];
            NSRange rang2 = [shangStr rangeOfString:tem2];
            NSString * newOne = [gongStr stringByReplacingCharactersInRange:rang1 withString:replace];
            NSString * newTwo = [shangStr stringByReplacingCharactersInRange:rang2 withString:replace];
            float gongLilv = [newOne floatValue]/100/12;//公积金贷款利率
            float shangLilv = [newTwo floatValue]/100/12;//商业贷款利率
            float zongDai = gongKuan + shangKuan;//贷款总额
            float yueHuan = gongKuan*gongLilv*powf(1+gongLilv, yueShu)/(powf(1+gongLilv, yueShu)-1)+shangKuan*shangLilv*powf(1+shangLilv, yueShu)/(powf(1+shangLilv, yueShu)-1);//每月还款
            float zongHuan = yueHuan*yueShu;//还款总额
            float zhiLi = zongHuan-zongDai;//支付利息
            NSArray * array1 = [NSArray arrayWithObjects:@"贷款总额",@"还款总额",@"支付利息",@"贷款月数",@"月均还款", nil];
            NSString * str1 = [NSString stringWithFormat:@"%.0f 元",zongDai];
            NSString * str2 = [NSString stringWithFormat:@"%.0f 元",zongHuan];
            NSString * str3 = [NSString stringWithFormat:@"%.0f 元",zhiLi];
            NSString * str4 = [NSString stringWithFormat:@"%d",yueShu];
            NSString * str5 = [NSString stringWithFormat:@"%.2f 元",yueHuan];
            NSArray * array2 = [NSArray arrayWithObjects:str1,str2,str3,str4,str5, nil];
            
            [self reloadJisuanResult:array2 type:@"3"];
        }
    }
    if ([resultType isEqualToString:@"组合型贷款等额本金"]) {
        if (gongDai.text.length==0 && shangDai.text.length>0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入公积金贷款总额" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else if (shangDai.text.length==0 && gongDai.text.length>0){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入商业贷款总额" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else if (gongDai.text.length==0 && shangDai.text.length==0){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入公积金贷款总额" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else{
            userContentView.contentSize = CGSizeMake(SCREEN_WIDTH, 530+SCREEN_HEIGHT);
            jisuanView.hidden=NO;
            ShuiJisuanView.hidden=YES;
            CGPoint position = CGPointMake(0, 450);
            [userContentView setContentOffset:position animated:YES];
            
            //每月还款数组
            NSMutableArray * array4 = [[NSMutableArray alloc]initWithCapacity:0];
            //月数数组
            NSMutableArray * array3 = [[NSMutableArray alloc]initWithCapacity:0];
            float gongKuan = [gongDai.text floatValue]*10000;//公积金贷款
            float shangKuan = [shangDai.text floatValue]*10000;//商业贷款
            int yueShu = [[array_6 objectAtIndex:[array_2 indexOfObject:zuHeNian.text]] intValue]*12;//贷款月数
            //字符串替换
            NSString * gongStr = label_5.text;
            NSString * shangStr = label_6.text;
            NSString * tem1 = @"公积金贷款利率";
            NSString * tem2 = @"商业贷款利率";
            NSString * replace = @"";
            NSRange rang1 = [gongStr rangeOfString:tem1];
            NSRange rang2 = [shangStr rangeOfString:tem2];
            NSString * newOne = [gongStr stringByReplacingCharactersInRange:rang1 withString:replace];
            NSString * newTwo = [shangStr stringByReplacingCharactersInRange:rang2 withString:replace];
            float gongLilv = [newOne floatValue]/100/12;//公积金贷款利率
            float shangLilv = [newTwo floatValue]/100/12;//商业贷款利率
            float zongDai = gongKuan + shangKuan;//贷款总额
            float gongJun = gongKuan/yueShu;//公积金贷款每月所还本金
            float shangJun = shangKuan/yueShu;//商业贷款每月所还本金
            float zongHuan = 0.0;//还款总额
            float yueHuan0=0;
            for (int i=0; i<yueShu; i++) {
                float yueHuan = gongJun+(gongKuan-gongJun*i)*gongLilv+shangJun+(shangKuan-shangJun*i)*shangLilv;
                if(i==0){
                    yueHuan0=yueHuan;
                }
                NSString * strKuan = [NSString stringWithFormat:@"%.2f 元",yueHuan];
                NSString * strYue = [NSString stringWithFormat:@"第%d月",i+1];
                [array4 addObject:strKuan];
                [array3 addObject:strYue];
                zongHuan+=yueHuan;
            }
            float zhiLi = zongHuan-zongDai;//支付利息
            NSArray * array1 = [NSArray arrayWithObjects:@"贷款总额",@"还款总额",@"支付利息",@"贷款月数", nil];
            NSString * str1 = [NSString stringWithFormat:@"%.0f 元",zongDai];
            NSString * str2 = [NSString stringWithFormat:@"%.0f 元",zongHuan];
            NSString * str3 = [NSString stringWithFormat:@"%.0f 元",zhiLi];
            NSString * str4 = [NSString stringWithFormat:@"%d 月",yueShu];
            NSString * str5 = [NSString stringWithFormat:@"%.2f 元",yueHuan0];
            NSArray * array2 = [NSArray arrayWithObjects:str1,str2,str3,str4,str5, nil];
            [self reloadJisuanResult:array2 type:@"3"];
            
        }
    }
    
    if([resultType rangeOfString:@"税费计算新房"].location!=NSNotFound){
        if (newMianjiText.text.length==0 && newDanText.text.length>0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入面积" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else if (newDanText.text.length==0 && newMianjiText.text.length>0){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入单价" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else if (newDanText.text.length==0 && newMianjiText.text.length==0){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入面积" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        
        userContentView.contentSize = CGSizeMake(SCREEN_WIDTH, 450+590);
        CGPoint position = CGPointMake(0, 500);
        [userContentView setContentOffset:position animated:YES];
        jisuanView.hidden=YES;
        ShuiJisuanView.hidden=NO;
    
        
        //税费计算新房
        float mianji=[newMianjiText.text floatValue];
        float danjia=[newDanText.text floatValue];
        NSString *newPutong=newputongL.text;
        NSString *weiyiStr=@"";
        if(weiyiBtn1.selected){
            weiyiStr=@"唯一";
        }
        else{
            weiyiStr=@"非唯一";
        }
        NSString * str1 = [NSString stringWithFormat:@"%.0f",mianji];
        NSString * str2 = [NSString stringWithFormat:@"%.0f",danjia];
        NSString * str3 = [NSString stringWithFormat:@"%@",newPutong];
        NSString * str4 = [NSString stringWithFormat:@"%@",weiyiStr];
        NSArray * array2 = [NSArray arrayWithObjects:str1,str2,str3,str4, nil];
        [self reloadJisuanResult:array2 type:@"4"];

    }
    
    if([resultType rangeOfString:@"税费计算二手房"].location!=NSNotFound){
        if (erMianjiText.text.length==0 && erDanText.text.length>0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入面积" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else if (erDanText.text.length==0 && erMianjiText.text.length>0){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入单价" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        else if (erDanText.text.length==0 && erMianjiText.text.length==0){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入面积" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
            return;
        }
        
        userContentView.contentSize = CGSizeMake(SCREEN_WIDTH, 450+590);
        CGPoint position = CGPointMake(0, 500);
        [userContentView setContentOffset:position animated:YES];
        jisuanView.hidden=YES;
        ShuiJisuanView.hidden=NO;
        
        //税费计算新房
        float mianji=[erMianjiText.text floatValue];
        float danjia=[erDanText.text floatValue];
        NSString *erPutong=erputongL.text;
        NSString *erNian=erNianL.text;

        NSString * str1 = [NSString stringWithFormat:@"%.0f",mianji];
        NSString * str2 = [NSString stringWithFormat:@"%.0f",danjia];
        NSString * str3 = [NSString stringWithFormat:@"%@",erPutong];
        NSString * str4 = [NSString stringWithFormat:@"%@",erNian];
        NSString * str5=@"1";
        if(erleftBtn1.selected){
            str5=@"1";
        }else{
            str5=@"0";
        }
        NSString * str6=@"1";
        if(erleftBtn2.selected){
            str6=@"1";
        }else{
            str6=@"0";
        }
        NSString * str7=@"1";
        if(erleftBtn3.selected){
            str7=@"1";
        }else{
            str7=@"0";
        }
        NSArray * array2 = [NSArray arrayWithObjects:str1,str2,str3,str4,str5,str6,str7, nil];
        [self reloadJisuanResult:array2 type:@"5"];
        
        
    }
    
    [shangJiaGe resignFirstResponder];
    [shangMianJi resignFirstResponder];
    [shangZong resignFirstResponder];
    [gongDai resignFirstResponder];
    [gongZong resignFirstResponder];
    [gongMianJi resignFirstResponder];
    [shangDai resignFirstResponder];
}

//type 1单价 ，2 总价 ，3，组合， 4，税费新房 ，5税费二手房
-(void)reloadJisuanResult:(NSArray*)resultList type:(NSString*)type{
    NSArray * array1 = [NSArray arrayWithObjects:@"房款总额",@"贷款总额",@"还款总额",@"支付利息",@"首付金额",@"贷款月数",@"月均还款",@"月利率", nil];
    NSArray * array11 =[NSArray arrayWithObjects:@"房款总额",@"贷款总额",@"还款总额",@"支付利息",@"首付金额",@"还款月数", @"月利率",nil];

    //单价计算
    if(resultList.count==8){
        sliceColors =[NSArray arrayWithObjects:
                      [UIColor colorWithRed:0/255.0 green:199/255.0 blue:217/255.0 alpha:1],
                      [UIColor colorWithRed:246/255.0 green:155/255.0 blue:40/255.0 alpha:1],
                      [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],nil];
        
        zongjiaL.text=[NSString stringWithFormat:@"%@",[resultList objectAtIndex:0]];
        daikuanzongL.text=[resultList objectAtIndex:1];
        huankuanzongL.text=[resultList objectAtIndex:2];
        lixiL.text=[resultList objectAtIndex:3];
        shoufuL.text=[resultList objectAtIndex:4];
        shouyueL.text=[resultList objectAtIndex:6];
        lilvL.text=[resultList objectAtIndex:7];
        
        zongjiaLabel.hidden=NO;
        shoufuLabel.hidden=NO;
        zongjiaL.hidden=NO;
        shoufuL.hidden=NO;
        leftLabel1.hidden=NO;
        
        NSString *shouyue=[resultList objectAtIndex:6];
        shouyue=[shouyue stringByReplacingOccurrencesOfString:@" 元"withString:@""];
        float shoufu=[[resultList objectAtIndex:4]floatValue];
        float daikuan=[[resultList objectAtIndex:1]floatValue];
        float lixi=[[resultList objectAtIndex:3]floatValue];
        float total=shoufu+daikuan+lixi;
        
        float shoufubi=100*shoufu/total;
        float daikuanbi=100*daikuan/total;
        float lixibi=100*lixi/total;
        
        [slices removeAllObjects];
        slices=[[NSMutableArray alloc]initWithObjects:[NSNumber numberWithFloat:shoufubi], [NSNumber numberWithFloat:daikuanbi],[NSNumber numberWithFloat:lixibi],nil];
        pieLabel.text=[NSString stringWithFormat:@"¥:%@",shouyue];
        [pieChartLeft reloadData];
        
    }
    
    //总价计算
    if(resultList.count==6){
        sliceColors =[NSArray arrayWithObjects:
                      [UIColor colorWithRed:246/255.0 green:155/255.0 blue:40/255.0 alpha:1],
                      [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],nil];
        
        NSArray * array1 = [NSArray arrayWithObjects:@"贷款总额",@"还款总额",@"支付利息",@"贷款月数",@"月均还款", nil];
        zongjiaL.text=@"";
        daikuanzongL.text=[resultList objectAtIndex:0];
        huankuanzongL.text=[resultList objectAtIndex:1];
        lixiL.text=[resultList objectAtIndex:2];
        shoufuL.text=@"";
        shouyueL.text=[resultList objectAtIndex:4];
        lilvL.text=[resultList objectAtIndex:5];
        
        zongjiaLabel.hidden=YES;
        shoufuLabel.hidden=YES;
        zongjiaL.hidden=YES;
        shoufuL.hidden=YES;
        leftLabel1.hidden=YES;

        
        NSString *shouyue=[resultList objectAtIndex:4];
        shouyue=[shouyue stringByReplacingOccurrencesOfString:@" 元"withString:@""];
        
        float daikuan=[[resultList objectAtIndex:0]floatValue];
        float lixi=[[resultList objectAtIndex:2]floatValue];
        float total=daikuan+lixi;

        float daikuanbi=100*daikuan/total;
        float lixibi=100*lixi/total;
        
        [slices removeAllObjects];
        slices=[[NSMutableArray alloc]initWithObjects:[NSNumber numberWithFloat:daikuanbi],[NSNumber numberWithFloat:lixibi],nil];
        pieLabel.text=[NSString stringWithFormat:@"¥:%@",shouyue];
        [pieChartLeft reloadData];
        
    }
    
    //组合计算
    if(resultList.count==5){
        sliceColors =[NSArray arrayWithObjects:
                      [UIColor colorWithRed:246/255.0 green:155/255.0 blue:40/255.0 alpha:1],
                      [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],nil];
        
        NSArray * array1 = [NSArray arrayWithObjects:@"贷款总额",@"还款总额",@"支付利息",@"贷款月数",@"月均还款", nil];
        zongjiaL.text=@"";
        daikuanzongL.text=[resultList objectAtIndex:0];
        huankuanzongL.text=[resultList objectAtIndex:1];
        lixiL.text=[resultList objectAtIndex:2];
        shoufuL.text=@"";
        shouyueL.text=[resultList objectAtIndex:4];
        
        zongjiaLabel.hidden=YES;
        shoufuLabel.hidden=YES;
        zongjiaL.hidden=YES;
        shoufuL.hidden=YES;
        leftLabel1.hidden=YES;
        
        NSString *shouyue=[resultList objectAtIndex:4];
        shouyue=[shouyue stringByReplacingOccurrencesOfString:@" 元"withString:@""];
        
        float daikuan=[[resultList objectAtIndex:0]floatValue];
        float lixi=[[resultList objectAtIndex:2]floatValue];
        float total=daikuan+lixi;
        
        float daikuanbi=100*daikuan/total;
        float lixibi=100*lixi/total;
        
        [slices removeAllObjects];
        slices=[[NSMutableArray alloc]initWithObjects:[NSNumber numberWithFloat:daikuanbi],[NSNumber numberWithFloat:lixibi],nil];
        pieLabel.text=[NSString stringWithFormat:@"¥:%@",shouyue];
        [pieChartLeft reloadData];
        
    }
    
    //税费新房
    if([type isEqualToString:@"4"]){
        float mianji=[[resultList objectAtIndex:0]floatValue];
        float danjia=[[resultList objectAtIndex:1]floatValue];
        NSString *putong=[resultList objectAtIndex:2];
        NSString *weiyi=[resultList objectAtIndex:3];
        
        float zongjia=mianji*danjia;
        float gongzheng=zongjia*0.003;
        float chanquanfei=zongjia *0.003;
        float maimaishouxufei=500;
        float qishui=zongjia*0.015;
        float yinhuashui=zongjia*0.0005;
        
        if([weiyi isEqualToString:@"唯一"]){
            if(mianji<=90){
                qishui=zongjia*0.01;
            }
            else if(mianji>90&&mianji<=144){
                qishui=zongjia*0.015;
            }
            else if(mianji>144){
                qishui=zongjia*0.03;
            }
        }
        else{
            qishui=zongjia*0.03;
        }
        
        float zongshui=gongzheng+chanquanfei+maimaishouxufei+qishui+yinhuashui;
        
        zongjiaLs.text=[NSString stringWithFormat:@"%.1f",zongjia];
        gongzhengLs.text=[NSString stringWithFormat:@"%.1f",gongzheng];
        chanquanLs.text=[NSString stringWithFormat:@"%.1f",chanquanfei];
        maimaiLs.text=[NSString stringWithFormat:@"%.1f",maimaishouxufei];
        qishuiLs.text=[NSString stringWithFormat:@"%.1f",qishui];
        yinhuaLs.text=[NSString stringWithFormat:@"%.1f",yinhuashui];
        zongshuiLs.text=[NSString stringWithFormat:@"%.1f",zongshui];
        zongshuiLs2.hidden=YES;
        
        sliceColors =[NSArray arrayWithObjects:
                      [UIColor colorWithRed:0/255.0 green:199/255.0 blue:217/255.0 alpha:1],
                      [UIColor colorWithRed:246/255.0 green:155/255.0 blue:40/255.0 alpha:1],
                      [UIColor colorWithRed:252/255.0 green:102/255.0 blue:40/255.0 alpha:1],
                      [UIColor colorWithRed:70/255.0 green:185/255.0 blue:119/255.0 alpha:1],
                      [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],nil];
        
        [slices removeAllObjects];
        slices=[[NSMutableArray alloc]initWithObjects:[NSNumber numberWithFloat:gongzheng],[NSNumber numberWithFloat:chanquanfei],[NSNumber numberWithFloat:maimaishouxufei],[NSNumber numberWithFloat:qishui],[NSNumber numberWithFloat:yinhuashui],nil];
        pieLabel2.text=[NSString stringWithFormat:@"¥:%.0f",zongshui];
        [pieChartLeft2 reloadData];

        left66.hidden=YES;
        shuiLeftL2.text=@"公证费";
        shuiLeftL3.text=@"委托产权费";
        shuiLeftL4.text=@"卖卖手续费";
        shuiLeftL5.text=@"契税";
        shuiLeftL6.text=@"印花税";
        shuiLeftL7.text=@"税金总额";
        shuiLeftL8.text=@"税金总额";
        shuiLeftL8.hidden=YES;
        return;
    }
    
    //税费二手房
    if([type isEqualToString:@"5"]){
        float mianji=[[resultList objectAtIndex:0]floatValue];
        float danjia=[[resultList objectAtIndex:1]floatValue];
        NSString *putong=[resultList objectAtIndex:2];
        NSString *nianxian=[resultList objectAtIndex:3];
        NSString *left1=[resultList objectAtIndex:4];
        NSString *left2=[resultList objectAtIndex:5];
        NSString *left3=[resultList objectAtIndex:6];
        
        float zongjia=mianji*danjia;
        float yingye=zongjia*0.003;
        float gerensuode=zongjia *0.01;
        float qishui=zongjia*0.015;
        float yinhuashui=zongjia*0.0005;
        float gongbenyinhua=5;
        float zonghedijia=0;
        
        //唯一住房对契税的影响
        if([left3 isEqualToString:@"1"]){
            if(mianji<=90){
                qishui=zongjia*0.01;
            }
            else if(mianji>90&&mianji<=144){
                qishui=zongjia*0.015;
            }
            else if(mianji>144){
                qishui=zongjia*0.03;
            }
            
            //self.array_8 = [NSArray arrayWithObjects:@"不满两年",@"满两年不满五年",@"满五年",nil];
        }
        else{
            qishui=zongjia*0.03;
        }
        
        //营业税
        if([nianxian isEqualToString:@"不满两年"]){
            yingye=zongjia*0.056;
            gerensuode=zongjia*0.01;
        }
        if([nianxian isEqualToString:@"满两年不满五年"]){
            yingye=0;
            gerensuode=zongjia*0.01;
        }
        if([nianxian isEqualToString:@"满五年"]){
            gerensuode=0;
            yingye=0;
        }
        
        //经济适用房有综合地价款
        if([putong isEqualToString:@"经济适用房"]){
            zonghedijia=zongjia*0.1;
        }
        
        //非普通住宅
        if([putong isEqualToString:@"非普通住宅"]){
            qishui=zongjia*0.03;
        }
        
        //购置满两年，营业税免
        if([left1 isEqualToString:@"1"]){
            yingye=0;
        }
        
        float zongshui=qishui+yingye+yinhuashui+gerensuode+gongbenyinhua+zonghedijia;
        
        zongjiaLs.text=[NSString stringWithFormat:@"%.1f",zongjia];
        gongzhengLs.text=[NSString stringWithFormat:@"%.1f",qishui];
        chanquanLs.text=[NSString stringWithFormat:@"%.1f",yingye];
        maimaiLs.text=[NSString stringWithFormat:@"%.1f",yinhuashui];
        qishuiLs.text=[NSString stringWithFormat:@"%.1f",gerensuode];
        yinhuaLs.text=[NSString stringWithFormat:@"%.1f",gongbenyinhua];
        zongshuiLs.text=[NSString stringWithFormat:@"%.1f",zonghedijia];
        zongshuiLs2.text=[NSString stringWithFormat:@"%.1f",zongshui];
        zongshuiLs2.hidden=NO;
        
        sliceColors =[NSArray arrayWithObjects:
                      [UIColor colorWithRed:0/255.0 green:199/255.0 blue:217/255.0 alpha:1],
                      [UIColor colorWithRed:246/255.0 green:155/255.0 blue:40/255.0 alpha:1],
                      [UIColor colorWithRed:252/255.0 green:102/255.0 blue:40/255.0 alpha:1],
                      [UIColor colorWithRed:70/255.0 green:185/255.0 blue:119/255.0 alpha:1],
                      [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],
                      [UIColor colorWithRed:129/255.0 green:66/255.0 blue:115/255.0 alpha:1],nil];
        
        [slices removeAllObjects];
        slices=[[NSMutableArray alloc]initWithObjects:[NSNumber numberWithFloat:qishui],[NSNumber numberWithFloat:yingye],[NSNumber numberWithFloat:yinhuashui],[NSNumber numberWithFloat:gerensuode],[NSNumber numberWithFloat:gongbenyinhua],[NSNumber numberWithFloat:zonghedijia],nil];
        pieLabel2.text=[NSString stringWithFormat:@"¥:%.0f",zongshui];
        [pieChartLeft2 reloadData];
        
        left66.hidden=NO;
        shuiLeftL2.text=@"契税";
        shuiLeftL3.text=@"营业税";
        shuiLeftL4.text=@"印花税";
        shuiLeftL5.text=@"个人所得税";
        shuiLeftL6.text=@"工本印花税";
        shuiLeftL7.text=@"综合地价款";
        shuiLeftL8.text=@"税金总额";
        shuiLeftL8.hidden=NO;
        
    }
}



-(IBAction)gotoUp:(id)sender{
    CGPoint position = CGPointMake(0, 0);
    [userContentView setContentOffset:position animated:YES];
}

//回收键盘
-(void)closeKeyBoad
{
    [shangJiaGe resignFirstResponder];
    [shangMianJi resignFirstResponder];
    [shangZong resignFirstResponder];
    [gongJiaGe resignFirstResponder];
    [gongMianJi resignFirstResponder];
    [gongZong resignFirstResponder];
    [gongDai resignFirstResponder];
    [shangDai resignFirstResponder];
    [newMianjiText resignFirstResponder];
    [newDanText resignFirstResponder];
    [erMianjiText resignFirstResponder];
    [erDanText resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
