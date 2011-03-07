#import "Stats.h"

static NSString* SIGNATURE_KEY = @"signature";

@implementation Stats

+ (NSString*)uuid {
  CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
  CFStringRef uuidString = CFUUIDCreateString(kCFAllocatorDefault, uuid);
  
  static const int BUFFER_SIZE = 100;
  char strBuffer[BUFFER_SIZE];
  CFStringGetCString(uuidString, strBuffer, BUFFER_SIZE, kCFStringEncodingASCII);
  return [NSString stringWithUTF8String:strBuffer];  
}

+ (NSString*)signature {
  NSString* bundlePath = [NSBundle pathForResource:@"Info" ofType:@"plist" inDirectory:[[NSBundle mainBundle] bundlePath]];
  NSMutableDictionary* settings = [NSMutableDictionary dictionaryWithContentsOfFile:bundlePath];
  
  if (![settings valueForKey:SIGNATURE_KEY]) {
    [settings setValue:[Stats uuid] forKey:SIGNATURE_KEY];
    [settings writeToFile:bundlePath atomically:YES];
  }

  return [settings valueForKey:SIGNATURE_KEY];
}

+ (void)request:(NSString*)urlString {
  NSURL* url = [NSURL URLWithString:urlString];
  NSURLRequest* request = [NSURLRequest requestWithURL:url];
  [[NSURLConnection alloc]initWithRequest:request delegate:self];    
}

@end