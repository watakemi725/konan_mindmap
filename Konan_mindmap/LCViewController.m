//
//  LCViewController.m
//  Konan_mindmap
//
//  Created by ぬっきー on 2014/06/29.
//  Copyright (c) 2014年 takemi. All rights reserved.
//

#import "LCViewController.h"

@interface LCViewController (){
    
    //set up a placeholder variable for the textfield user typing
    //UITextView *currentTextView;
    
}

@end

@implementation LCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
[self addDoneToolBarToKeyboard:mytextview];
    
}

-(IBAction)go{
    
    label.text=mytextview.text;
    NSLog(@"%@",mytextview.text);
    
}




-(void)addDoneToolBarToKeyboard:(UITextView *)textView
{
    UIToolbar* doneToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    doneToolbar.barStyle = UIBarStyleBlackTranslucent;
    doneToolbar.items = [NSArray arrayWithObjects:
                         [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                         [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonClickedDismissKeyboard)],
                         nil];
    [doneToolbar sizeToFit];
    textView.inputAccessoryView = doneToolbar;
}

//remember to set your text view delegate
//but if you only have 1 text view in your view controller
//you can simply change currentTextField to the name of your text view
//and ignore this textViewDidBeginEditing delegate method
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    mytextview = textView;
}

-(void)doneButtonClickedDismissKeyboard
{
    [mytextview resignFirstResponder];
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
