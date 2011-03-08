#import <Foundation/Foundation.h>

@interface Stats : NSObject {

}

+ (NSString*)host;
+ (void)request:(NSString*)urlString;
+ (NSString*)signature;
+ (NSString*)uuid;
+ (NSString*)deviceid;
+ (NSString*)name;
+ (NSDictionary*)gameBundle;

+ (void)report:(NSString*)event;

@end
