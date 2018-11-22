//
//  ViewController.m
//  Modal
//
//  Created by hualala on 2018/11/20.
//  Copyright © 2018 hualala. All rights reserved.
//

#import "ViewController.h"
#import "CCActionSheet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)buttonClick:(UIButton *)sender {
    CCActionSheet *avc = [CCActionSheet new];
    [self presentViewController:avc animated:NO completion:nil];
}


@end
