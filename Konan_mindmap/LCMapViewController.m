//
//  LCMapViewController.m
//  Konan_mindmap
//
//  Created by ぬっきー on 2014/07/19.
//  Copyright (c) 2014年 takemi. All rights reserved.
//

#import "LCMapViewController.h"

@interface LCMapViewController (){
    
    
    
}

@end

@implementation LCMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    
    
    /*
     
     
     int matome=0;
     int matome_english=0;
     int matome_math=0;
     int matome_japanese=0;
     
     
     
     struct _scoreItem{
     int english;
     int math;
     int japanese;
     };
     
     struct _scoreItem scoreItem[5]={
     {40,66,70},
     {30,90,70},
     {64,67,70},
     {98,99,70},
     {65,59,70},
     };
     
     int i;
     for (i=0; i<5; i++) {
     NSLog(@"%d番目の私は、英語は%d点,数学は%d点,国語は%d点",i,scoreItem[i].english,scoreItem[i].math ,scoreItem[i].japanese);
     
     matome=matome+scoreItem[i].english+scoreItem[i].math +scoreItem[i].japanese;
     
     
     matome_english=matome_english+scoreItem[i].english;
     matome_math=matome_math+scoreItem[i].math;
     matome_japanese=matome_japanese+scoreItem[i].japanese;
     
     
     
     }
     NSLog(@"総合点は%dで、その平均点は%dである",matome,matome/5);
     NSLog(@"英語の平均点は%dです",matome_english/5);
     NSLog(@"数学の平均点は%dです",matome_math/5);
     NSLog(@"国語の平均点は%dです",matome_japanese/5);
     
     
     */
    
    x=0;
   // x=map.frame.origin.x;
    y=map.frame.origin.y;
    
    
    //[self addidea:<#(int)#> y:<#(int)#> text:<#(NSString *)#>]
    
    
    
    
//    pointArray=[NSMutableArray arrayWithCapacity:2];
//    [pointArray addObject:@[x_point,y_point]];z
    
}

-(void)viewDidAppear:(BOOL)animated{
    UITapGestureRecognizer *gs = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapGesture:)];
   
    [map addGestureRecognizer:gs];
}


-(IBAction)newidea{
    NSLog(@"newidea");
    
    //画面上にtextfield生成
    //場所をずらして表示させるには??
    
    // UITextFieldのインスタンスを生成
    CGRect rect = CGRectMake(x,y , 200, 25);
    x=x+50;
    y=y+50;
    
    UITextField *textField = [[UITextField alloc]initWithFrame:rect];
    
    // 枠線のスタイルを設定
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    // テキストを左寄せにする
    textField.textAlignment = UITextAlignmentLeft;
    
    // ラベルのテキストのフォントを設定
    textField.font = [UIFont fontWithName:@"Helvetica" size:14];
    
    // プレースホルダ
    textField.placeholder = @"アイディアを入力してください";
    
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
-(IBAction)wao{
    [self addidea];
}

-(void)TapGesture:(UITapGestureRecognizer *)sender{
    CGPoint point = [sender locationOfTouch:0 inView:map];
    NSLog(@"tap point: %@", NSStringFromCGPoint(point));
    NSString *example;
    [self addidea:point.x y:point.y text:example];

}


-(void)addidea{
    
    UIImageView *ideaview = [[UIImageView alloc]init];
    ideaview.frame=CGRectMake(x, y, 200, 200);
    
    x=x+250;
    y=y+250;
    
    // UITextFieldのインスタンスを生成
    CGRect rect = CGRectMake(ideaview.frame.size.width/2, ideaview.frame.size.height/2, 200, 25);
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
    [ideaview addSubview:textField];
    
    [map addSubview:ideaview];
    
    
                             
    
}


-(void)addidea:(int)point_x y:(int)point_y text:(NSString *)idea_text{
    
    
   // float vecdata[3][2] = { {39 , 130},{40 , 140},{41 , 135} };
    
    
    
    NSLog(@"newidea");
    
    //画面上にtextfield生成
    //場所をずらして表示させるには??
    
    // UITextFieldのインスタンスを生成
    
    CGRect rect = CGRectMake(point_x-100,point_y, 200, 25);
    
//    CGRect rect = CGRectMake(vecdata[x][0],vecdata[x][1] , 200, 25);
//    x=x+1;
//    y=y+50;
    
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

-(IBAction)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
