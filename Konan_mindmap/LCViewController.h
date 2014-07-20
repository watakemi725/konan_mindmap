//
//  LCViewController.h
//  Konan_mindmap
//
//  Created by ぬっきー on 2014/06/29.
//  Copyright (c) 2014年 takemi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCViewController : UIViewController<UITextViewDelegate>{


    

    IBOutlet UITextView *mytextview;
    IBOutlet UILabel *label;
}

-(IBAction)go;



@end
