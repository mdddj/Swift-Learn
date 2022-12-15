//
//  main.m
//  StringPropertyDemo1
//
//  Created by ldd on 2022/7/26.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str1 = @"梁典典";
        NSString *copyString =  [str1 copy];
        
    
        NSMutableString *ns1 = [NSMutableString stringWithFormat:@"梁典典"];
        NSMutableString *ns2 = [ns1 copy];
        
    }
    return 0;
}
