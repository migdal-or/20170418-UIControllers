//
//  ViewControllerNext.m
//  2017-04-18-ex1
//
//  Created by iOS-School-1 on 18.04.17.
//  Copyright © 2017 iOS-School-1. All rights reserved.
//

#import "ViewControllerNext.h"

@interface ViewControllerNext ()
@property (nonatomic, strong) IBOutlet UIButton *buttonBack;
@end

@implementation ViewControllerNext

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:666];
    self.buttonBack = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    [self.view addSubview:self.buttonBack];
    
    [self.buttonBack addTarget:self
                        action:@selector(backButtonTapped:)
              forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)backButtonTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
