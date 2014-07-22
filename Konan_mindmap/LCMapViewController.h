//
//  LCMapViewController.h
//  Konan_mindmap
//
//  Created by ぬっきー on 2014/07/19.
//  Copyright (c) 2014年 takemi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCMapViewController : UIViewController<UIScrollViewDelegate,UIGestureRecognizerDelegate>{

    IBOutlet UIScrollView *map;

        UIImageView *imageView;

    //イメージの位置

    int x;
    int y;
    
    NSMutableArray *pointArray;
    
    float vecdata[3][2];
    
}

-(void)TapGesture:(UITapGestureRecognizer *)sender;

-(IBAction)newidea;

-(IBAction)back;

-(IBAction)wao;

-(void)addidea:(int)point_x y:(int)point_y text:(NSString*)idea_text;

//-(void)newlabel

-(float)gageOneAnimation2:(float)speedTime fromNum:(float)StartNum DetailStop:(float)StopNum ;



@end
