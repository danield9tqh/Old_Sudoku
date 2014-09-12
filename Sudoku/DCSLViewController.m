//
//  DCSLViewController.m
//  Sudoku
//
//  Created by Daniel Cogan on 9/11/14.
//  Copyright (c) 2014 Daniel Cogan & Shannon Lin. All rights reserved.
//

#import "DCSLViewController.h"

int initArray[9][9] = {
    {7, 0, 0, 4, 2, 0, 0, 0, 9},
    {0, 0, 9, 5, 0, 0, 0, 0, 4},
    {0, 2, 0, 6, 9, 0, 5, 0, 0},
    {6, 5, 0, 0, 0, 0, 4, 3, 0},
    {0, 8, 0, 0, 0, 6, 0, 0, 7},
    {0, 1, 0, 0, 4, 5, 6, 0, 0},
    {0, 0, 0, 8, 6, 0, 0, 0, 2},
    {3, 4, 0, 9, 0, 0, 1, 0, 0},
    {8, 0, 0, 3, 0, 2, 7, 4, 0}};


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
    [_button1 setBackgroundImage:[self imageWithColor: [UIColor greenColor]] forState:UIControlStateHighlighted];
    [self.view addSubview:_button1];
    
}
- (IBAction)buttonDown:(id)sender
{
    NSLog(@"Button 1 is highlighted");
    
    
}

- (IBAction)buttonPresses:(id)sender
{
    NSLog(@"Button 1 was pressed.");
    
}

//
// http://stackoverflow.com/questions/990976/how-to-create-a-colored-1x1-uiimage-on-the-iphone-dynamically

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 50 , 50);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
