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
    
    map.frame=self.view.bounds;
    
    map.bounces=NO;
    
    CGRect rect = CGRectMake(0, 0, 1000 , 524);
    //設定したサイズのUIImageViewを作成
    imageView = [[UIImageView alloc]initWithFrame:rect];
    
    // スクロールビュー背景画像を設定
    imageView.image = [UIImage imageNamed:@"chichi.png"];
    
    // UIScrollViewのインスタンスに画像を貼付ける
    [map addSubview:imageView];
    
    // UIScrollViewのコンテンツサイズを画像のサイズに合わせる
    map.contentSize = imageView.bounds.size;

    map.showsHorizontalScrollIndicator = NO; //スクロールバー非表示
    map.showsVerticalScrollIndicator = NO;
    
    map.delegate = self;
    
//    map.minimumZoomScale = 0.25;
//    map.maximumZoomScale = 2.0;
    
    
    //ボタンを作成
    UIButton *tapbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    tapbtn.frame=CGRectMake(imageView.frame.size.width/2, imageView.frame.size.height/2, imageView.frame.size.height/8, imageView.frame.size.height/8);
    [tapbtn setTitle:@"ボタン" forState:UIControlStateNormal];
    [tapbtn setBackgroundColor:[UIColor redColor]];
    
    [map addSubview:tapbtn];
    
    
}


-(IBAction)newidea{
    NSLog(@"newidea");
    
    //画面上にtextfield生成
//場所をずらして表示させるには??
    
    // UITextFieldのインスタンスを生成
    CGRect rect = CGRectMake(10, 10, 200, 25);
    UITextField *textField = [[UITextField alloc]initWithFrame:rect];
    
    // 枠線のスタイルを設定
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    // テキストを左寄せにする
    textField.textAlignment = UITextAlignmentLeft;
    
    // ラベルのテキストのフォントを設定
    textField.font = [UIFont fontWithName:@"Helvetica" size:14];
    
    // プレースホルダ
    textField.placeholder = @"名前を入力してください";
    
    
    // キーボードの種類を設定
    textField.keyboardType = UIKeyboardTypeDefault;
    
    // リターンキーの種類を設定
    textField.returnKeyType = UIReturnKeyDefault;
    
    // 編集中にテキスト消去ボタンを表示
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    // デリゲートを設定
    textField.delegate = self;
    
    // UITextFieldのインスタンスをビューに追加
    [map addSubview:textField];
    
}

/**
 * キーボードでReturnキーが押されたとき
 * @param textField イベントが発生したテキストフィールド
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // キーボードを隠す
    [self.view endEditing:YES];
    
    return YES;
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imageView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
