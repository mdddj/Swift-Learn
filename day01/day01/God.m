//
//  God.m
//  day01
//
//  Created by ldd on 2021/11/9.
//

#import "God.h"

@implementation God

- (void)killWithPerson:(Person *)person{
    NSLog(@"我是上帝%@,我要把%@给杀了",self->_name,person->_name);
    person -> _leftLife = 0;
}
@end
