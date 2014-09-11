//
//  DCSLViewController.m
//  Sudoku
//
//  Created by Daniel Cogan on 9/11/14.
//  Copyright (c) 2014 Daniel Cogan & Shannon Lin. All rights reserved.
//

#import "DCSLViewController.h"

@interface DCSLViewController (){
    UIButton* _button1;

}

@end

@implementation DCSLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGRect buttonFrame = CGRectMake(20, 20, 50, 50);
    _button1 = [[UIButton alloc] initWithFrame:buttonFrame];
    _button1.backgroundColor = [UIColor blueColor];
    [_button1 addTarget:self action:@selector(buttonPresses:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button1];
    
}

- (IBAction)buttonPresses:(id)sender
{
    NSLog(@"Button 1 was pressed.");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
