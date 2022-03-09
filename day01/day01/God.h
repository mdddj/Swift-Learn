//
//  God.h
//  day01
//
//  Created by ldd on 2021/11/9.
//

#import <Foundation/Foundation.h>
#import "Gender.h"
#import "Person.h"
NS_ASSUME_NONNULL_BEGIN

@interface God : NSObject
{
    @public
    NSString *_name;
    int _age;
    Gender _greade;
}

- (void) killWithPerson: (Person *)person;
@end

NS_ASSUME_NONNULL_END
