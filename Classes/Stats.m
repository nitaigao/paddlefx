#import "Stats.h"
#import <UIKit/UIKit.h>

static NSString* SIGNATURE_KEY = @"signature";
static NSString* HOST_KEY = @"PhoneHomeHost";

@implementation Stats

+ (NSDictionary*)gameBundle {
  NSString* bundlePath = [NSBundle pathForResource:@"Info" ofType:@"plist" inDirectory:[[NSBundle mainBundle] bundlePath]];
  return [NSMutableDictionary dictionaryWithContentsOfFile:bundlePath];
}

+ (NSString*)uuid {
  CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
  CFStringRef uuidString = CFUUIDCreateString(kCFAllocatorDefault, uuid);
  
  static const int BUFFER_SIZE = 100;
  char strBuffer[BUFFER_SIZE];
  CFStringGetCString(uuidString, strBuffer, BUFFER_SIZE, kCFStringEncodingASCII);
  return [NSString stringWithUTF8String:strBuffer];  
}

+ (NSString*)host {
  return [[Stats gameBundle] valueForKey:HOST_KEY];
}

+ (NSString*)signature {
  NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
  if (![settings valueForKey:SIGNATURE_KEY]) {
    [settings setValue:[Stats uuid] forKey:SIGNATURE_KEY];
  }
  return [settings valueForKey:SIGNATURE_KEY];
}

+ (NSString*)deviceid {
  UIDevice *device = [UIDevice currentDevice];
  return [device uniqueIdentifier]; 
}

+ (NSString*)name {
  return [[Stats gameBundle] valueForKey:@"CFBundleDisplayName"];
}

+ (void)request:(NSString*)urlString {
  NSURL* url = [NSURL URLWithString:urlString];
  NSURLRequest* request = [NSURLRequest requestWithURL:url];
  [[NSURLConnection alloc]initWithRequest:request delegate:self];    
}

+ (void)report:(NSString*)event {
  NSString* urlString = [NSString stringWithFormat:@"http://%@/%@/%@?signature=%@&device=%@", [Stats host], [Stats name], event, [Stats signature], [Stats deviceid]];
  [Stats request:urlString];  
}



@end