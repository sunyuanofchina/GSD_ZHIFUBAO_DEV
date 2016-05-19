//
//  SDAddItemViewController.m
//  GSD_ZHIFUBAO
//
//  Created by aier on 15-6-7.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

/*
 
 *********************************************************************************
 *
 * 在您使用此自动布局库的过程中如果出现bug请及时以以下任意一种方式联系我们，我们会及时修复bug并
 * 帮您解决问题。
 * 新浪微博:GSD_iOS
 * Email : gsdios@126.com
 * GitHub: https://github.com/gsdios
 *
 *********************************************************************************
 
 */

#import "SDAddItemViewController.h"
#import "SDAddItemGridView.h"
#import "SDHomeGridItemModel.h"
#import "SDGridItemCacheTool.h"

@interface SDAddItemViewController ()

@property (nonatomic, strong) SDAddItemGridView *mainView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation SDAddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:[self mainView]];

    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupMainView];
}

- (void)setupDataArray
{
    NSArray *itemsArray = [SDGridItemCacheTool addItemsArray];
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *itemDict in itemsArray) {
        SDHomeGridItemModel *model = [[SDHomeGridItemModel alloc] init];
        model.destinationClass = [SDBasicViewContoller class];
        model.imageResString =[itemDict.allValues firstObject];
        model.title = [itemDict.allKeys firstObject];
        [temp addObject:model];
    }
    _dataArray = [temp copy];
}

-(SDAddItemGridView*)mainView{
    if (!_mainView) {
        _mainView = [[SDAddItemGridView alloc] initWithFrame:self.view.bounds];
        _mainView.showsVerticalScrollIndicator = NO;
    }
    return _mainView;
}

- (void)setupMainView
{
//    SDAddItemGridView *mainView = [[SDAddItemGridView alloc] initWithFrame:self.view.bounds];
//    mainView.showsVerticalScrollIndicator = NO;
//    NSArray *titleArray = @[@"淘宝",
//                            @"生活缴费",
//                            @"教育缴费",
//                            @"红包",
//                            @"物流",
//                            @"信用卡",
//                            @"转账",
//                            @"爱心捐款",
//                            @"彩票",
//                            @"当面付",
//                            @"余额宝",
//                            @"AA付款",
//                            @"国际汇款",
//                            @"淘点点",
//                            @"淘宝电影",
//                            @"亲密付",
//                            @"股市行情",
//                            @"汇率换算",
//                            ];
//    
//    NSMutableArray *temp = [NSMutableArray array];
//    for (int i = 0; i < 18; i++) {
//        SDHomeGridItemModel *model = [[SDHomeGridItemModel alloc] init];
//        model.destinationClass = [SDBasicViewContoller class];
//        model.imageResString = [NSString stringWithFormat:@"i%02d", i];
//        model.title = titleArray[i];
//        [temp addObject:model];
//    }
//    
//    _dataArray = [temp copy];
    
    [self setupDataArray];
    _mainView.gridModelsArray = [_dataArray copy];
//    [self.view addSubview:mainView];
//    _mainView = mainView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
