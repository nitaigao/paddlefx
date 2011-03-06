#import <Foundation/Foundation.h>

@interface Stats : NSObject {

}

+ (void)request:(NSString*)urlString;
+ (NSString*)signature;
+ (NSString*)uuid;

@end
