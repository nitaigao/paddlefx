#import <Foundation/Foundation.h>

@interface Stats : NSObject {

}

+ (NSString*)host;
+ (void)request:(NSString*)urlString;
+ (NSString*)signature;
+ (NSString*)uuid;

@end
