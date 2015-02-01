//
//  SPXAppDelegate.m
//  SPXSubscripting
//
//  Created by CocoaPods on 02/01/2015.
//  Copyright (c) 2014 Shaps Mohsenin. All rights reserved.
//

#import "SPXAppDelegate.h"
#import "SPXSubscripting.h"

@implementation SPXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  NSDictionary *attributes = @{ NSParagraphStyleAttributeName : [NSParagraphStyle new],
                                NSFontAttributeName : [UIFont boldSystemFontOfSize:15],
                                };
  
  NSLog(@"%@", [self legacySolution:attributes]);
  NSLog(@"%@", [self spxSolution:attributes]);
  
  return YES;
}

- (NSDictionary *)legacySolution:(NSDictionary *)attributes
{
  NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"something to say"];
  
  [string replaceCharactersInRange:NSMakeRange(0, 9) withAttributedString:[NSAttributedString attributedStringWithString:@"other"]];
  [string insertAttributedString:[NSAttributedString attributedStringWithString:@"an"] atIndex:0];
  
  [string setAttributes:attributes range:NSMakeRange(0, string.length)];
  [string addAttribute:NSKernAttributeName value:@2 range:NSMakeRange(0, string.length)];
  [string setAttributes:attributes range:NSMakeRange(0, 10)];
  
  return [string attributesAtIndex:0 effectiveRange:nil];
}

- (NSDictionary *)spxSolution:(NSDictionary *)attributes
{
  NSMutableAttributedString *string = $("something to say").mutableCopy;
  
  string[[@0:9]] = @"other";
  string[0] = @"an";
  
  string.attributes[[@0:1:NSKernAttributeName]] = @2;
  string.attributes[0] = attributes;
  string.attributes[NSKernAttributeName] = @2;
  string.attributes[[@0:10]] = attributes;
  
  return string.attributes[0];
}

@end

