//
//  Person.m
//  day01
//
//  Created by ldd on 2021/11/9.
//

#import "Person.h"

@implementation Person
- (void)show{
    NSLog(@"我叫%@，我今年%d岁了",self->_name,self->_age);
    NSLog(@"我还有%d年可以活",self->_leftLife);
}
@end
