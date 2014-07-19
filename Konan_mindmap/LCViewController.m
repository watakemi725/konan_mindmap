//
//  LCViewController.m
//  Konan_mindmap
//
//  Created by ぬっきー on 2014/06/29.
//  Copyright (c) 2014年 takemi. All rights reserved.
//

#import "LCViewController.h"

@interface LCViewController ()

@end

@implementation LCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    
}

-(IBAction)go{
    
    label.text=textview.text;
    NSLog(@"%@",textview.text);
    
}



//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
//{
//    return imageView;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
