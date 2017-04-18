//
//  ViewController.m
//  2017-04-18-ex1
//
//  Created by iOS-School-1 on 18.04.17.
//  Copyright © 2017 iOS-School-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIButton *button;
//пустой кружок - нет связи, иначе привязан в сториборд
// объявили класс контроллера в сториборде как viewcon
// появился action

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self.button addTarget:self
//                    action:@selector(buttonTapped:)
//          forControlEvents:UIControlEventTouchUpInside]; ^^вот этот
}

- (IBAction)buttonTapped:(id)sender {
    // затащили этот батон на tapinside на сам viewcontr
//    а могли просто вызвать метод во viewdidload ^^
    UIViewController *vc = [UIViewController new];
    
    [self.navigationController pushViewController:vc
                                         animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
