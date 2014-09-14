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


}

@end

@implementation DCSLViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // Create Grid View
    double gridViewSize = 506;
    CGRect gridFrame = CGRectMake(110, 50, gridViewSize, gridViewSize);
    UIView* gridView = [[UIView alloc] initWithFrame:gridFrame];
    gridView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:gridView];
    
    //Array for sudoku cells
    NSMutableArray* cellColumnArray = [[NSMutableArray alloc] initWithCapacity:9];
    for (int i =0; i<9; i++) {
        NSMutableArray* cellRowArray = [[NSMutableArray alloc] initWithCapacity:9];
        [cellColumnArray insertObject:cellRowArray atIndex:i];
    }

    // column for loop
    for (int i = 0; i< sizeof(initArray)/sizeof(initArray[0]); i++) {
        
        // row for loop
        for (int j = 0; j< sizeof(initArray)/sizeof(initArray[0]); j++) {
            
            //Code for extra line inbetween 3x3 squares
            int extraX = 3;
            int extraY = 3;
//            if (i/3 == 0) {
//                extraX += 3;
//            }
//            if (j/3 == 0){
//                extraY += 3;
//            }
            
            // Create button and button frame
            UIButton* button;
            CGRect buttonFrame = CGRectMake(i*55 + 5 + (i/3)*extraY, j*55 + 5 + (j/3)*(extraX), 50, 50);
            button= [[UIButton alloc] initWithFrame:buttonFrame];
            button.backgroundColor = [UIColor whiteColor];
            
            NSString* buttonTitle = @"";
            if (initArray[i][j] != 0) {
                buttonTitle = [NSString stringWithFormat:@"%i", initArray[i][j]];
            }

            
            [button setTitle:buttonTitle forState: UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            // Highlight button when clicked
            [button addTarget:self action:@selector(buttonPresses:) forControlEvents:UIControlEventTouchUpInside];
            [button setBackgroundImage:[self imageWithColor: [UIColor yellowColor]] forState:UIControlStateHighlighted];
            [gridView addSubview:button];
            button.tag = (i+1)*10 + (j+1);
            
            //Insert the button into the array
            [[cellColumnArray objectAtIndex:i] insertObject:button atIndex:j];
        }
    }
    
    
    
    
}

- (IBAction)buttonPresses:(id)sender
{
    int row = ([sender tag] %10);
    int col = ([sender tag] /10);
    NSLog(@"Button in Row %d and Column %d was pressed", row, col);
    
}

// Method from:
// stackoverflow.com/questions/990976/how-to-create-a-colored-1x1-uiimage-on-the-iphone-dynamically

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
