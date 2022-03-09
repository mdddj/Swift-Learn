//
//  ViewController.m
//  demo
//
//  Created by ldd on 2021/11/17.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *base_label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _base_label.text = @"我被加载了";
}




- (IBAction)demo:(id)sender {
    NSLog(@"你好，我被点击了");
    _base_label.text = @"啊啊啊，我被点击了";
}
- (IBAction)helloworld:(id)sender {
    _base_label.text = @"楼下的按钮被点击了";
}





@end
