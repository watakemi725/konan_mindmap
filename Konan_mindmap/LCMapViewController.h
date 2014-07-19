//
//  LCMapViewController.h
//  Konan_mindmap
//
//  Created by ぬっきー on 2014/07/19.
//  Copyright (c) 2014年 takemi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCMapViewController : UIViewController<UIScrollViewDelegate>{

    IBOutlet UIScrollView *map;

        UIImageView *imageView;

    //イメージの位置

    int x;
    int y;
    
}


-(IBAction)newidea;

-(IBAction)back;

-(IBAction)wao;

-(void)addidea;

@end
