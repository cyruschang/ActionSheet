//
//  AViewController.m
//  Modal
//
//  Created by hualala on 2018/11/20.
//  Copyright © 2018 hualala. All rights reserved.
//

#import "CCActionSheet.h"

CGFloat const kCCAnimationDuration = 0.3f;
#define kCCSCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define kCCSCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define kCCContentViewHeight kCCContentViewHeight

@interface CCActionSheet ()

@property (nonatomic, strong) UIView *backgroundDismissView;

@end

@implementation CCActionSheet

- (instancetype)init {
    self = [super init];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        [self initUI];
    }
    return self;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"%s", __func__);
     [self setupDismissHandler];
    self.backgroundDismissView.frame = self.view.frame;
     [self setupContentView];
}

#pragma mark - Lazy Load

- (UIView *)backgroundDismissView {
    if (!_backgroundDismissView) {
        _backgroundDismissView = [UIView new];
        _backgroundDismissView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        [self.view addSubview:_backgroundDismissView];
    }
    return _backgroundDismissView;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, kCCSCREEN_HEIGHT,[UIScreen mainScreen].bounds.size.width, kCCContentViewHeight)];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_contentView];
    }
    return _contentView;
}


#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - UI Init

- (void)setupDismissHandler {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissController:)];
    tapGesture.numberOfTapsRequired = 1;
    [self.backgroundDismissView addGestureRecognizer:tapGesture];
}

- (void)initUI {
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)setupContentView {
    [UIView animateWithDuration:kCCAnimationDuration animations:^{
        self.contentView.frame = CGRectMake(0, kCCSCREEN_HEIGHT - kCCContentViewHeight, kCCSCREEN_WIDTH, kCCContentViewHeight);
        self.backgroundDismissView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    }];
}


#pragma mark - Target Methods

- (void)dismissController:(UITapGestureRecognizer *)gesture {
    [UIView animateWithDuration:kCCAnimationDuration animations:^{
        self.contentView.frame = CGRectMake(0, kCCSCREEN_HEIGHT, kCCSCREEN_WIDTH, kCCContentViewHeight);
        self.backgroundDismissView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}




@end
