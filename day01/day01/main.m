//
//  main.m
//  day01
//
//  Created by ldd on 2021/11/8.
//

#import <Foundation/Foundation.h>

#import "God.h"
#import "Gender.h"


/// 定义一个对象
@interface Product : NSObject
{
    
    /// public 表示熟悉是公开的，默认是私有的，如果是私有的，在外部不能设置它的值
    @public
    NSString *_title; // 商品名字
    int _count; // 销量
    float _price; // 价格
}

/// 没有返回值和没有参数的方法
- (void)buy;

///  有一个参数的方法
- (void)zixun: (NSString *)productName;

/// 有返回值，有多个参数的方法
- (int)add: (int)nummber : (int)number2 : (int)number3;

@end

@implementation Product

- (void)buy
{
    NSLog(@"客户购买了一包辣条");
}

- (void)zixun:(NSString *)productName
{
    NSLog(@"客户正在咨询%@商品",productName);
}

- (int)add:(int)nummber :(int)number2 :(int)number3
{
    return nummber + number2 + number3;
}

@end

int main(int argc, const char * argv[]) {
    
    
    
    
    
//    printf("你好啊");
    
    
    
    
    
    Product *p1 = [Product new];
    Product *p2 = [Product new];
    
    /// 设置对象的属性
    p1->_count = 18;
    p1->_title = @"辣条";
    p1 -> _price = 18.8f;
    
    // 方法二,设置属性 (*对象).属性名
    (*p2)._title = @"辣条";
    (*p2)._count = 100;
    (*p2)._price = 20.3f;
    
    NSLog(@"商品1的标题是%@,销量是%d,价格是%f",p1->_title,p1->_count,p1->_price);
    NSLog(@"商品2的标题是%@，销量是%d,价格是%f",p2->_title,p2->_count,p2->_price);
    
    
    
    
    /// 方法的调用
    [p1 buy];
    
    [p1 zixun:@"辣条"];
    
    int num = [p1 add:10 :20 :30];
    NSLog(@"相加的结果是%d",num);
    
    
    
    /// 创建一个上帝
    God *god = [God new];
    god -> _name = @"耶稣";
    god -> _age = 100;
    god -> _greade = mainr;
    
    /// 创建一个人
    Person *person1 = [Person new];
    person1->_name = @"小猪猪";
    person1->_age = 50;
    person1 -> _leftLife = 90;
    person1 -> _gender = woman;
    
    [person1 show];
    [god killWithPerson:person1];
    [person1 show];
    
    
    
    return 0;
}





