/*
   Copyright (c) 2015 Shaps Mohsenin. All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.

 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.

 THIS SOFTWARE IS PROVIDED BY Shaps Mohsenin `AS IS' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 EVENT SHALL Shaps Mohsenin OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "NSAttributedString+SPXAdditions.h"
#import <objc/runtime.h>
#import "SPXRange.h"

@interface NSAttributedString (Private)
- (void)spx_setAttributes:(NSDictionary *)attributes range:(SPXRange *)range;
@end

@interface SPXAttributedStringAttributes ()
@property (nonatomic, weak) NSAttributedString *string;
@end

@implementation SPXAttributedStringAttributes

- (NSDictionary *)objectAtIndexedSubscript:(NSUInteger)index
{
  return [self.string attributesAtIndex:index effectiveRange:nil];
}

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index
{
  if (![self.string isKindOfClass:[NSMutableAttributedString class]]) {
    NSAssert(NO, @"You cannot use subscripting on a non-mutable attributed string. Create a mutable copy first.");
    return;
  }
  
  NSMutableAttributedString *string = (NSMutableAttributedString *)self.string;
  [string setAttributes:object range:NSMakeRange(0, string.length)];
}

- (void)setObject:(id)object forKeyedSubscript:(id)key
{
  if (![self.string isKindOfClass:[NSMutableAttributedString class]]) {
    NSAssert(NO, @"You cannot use subscripting on a non-mutable attributed string. Create a mutable copy first.");
    return;
  }
  
  NSMutableAttributedString *string = (NSMutableAttributedString *)self.string;
  
  if ([key isKindOfClass:[SPXAttributeRange class]]) {
    SPXAttributeRange *range = key;
    [string addAttribute:range.attributeName value:object range:range.rangeValue];
    return;
  }
  
  if ([key isKindOfClass:[SPXRange class]]) {
    SPXRange *range = key;
    [string setAttributes:object range:range.rangeValue];
    return;
  }
  
  if ([key isKindOfClass:[NSString class]]) {
    NSString *attributeName = key;
    [string addAttribute:attributeName value:object range:NSMakeRange(0, string.length)];
    return;
  }
}

@end

@implementation NSAttributedString (SPXAdditions)

- (SPXAttributedStringAttributes *)attributes
{
  SPXAttributedStringAttributes *attributes = objc_getAssociatedObject(self, _cmd);
  
  if (!attributes) {
    attributes = [SPXAttributedStringAttributes new];
    attributes.string = self;
    
    objc_setAssociatedObject(self, _cmd, attributes, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  }
  
  return attributes;
}

+ (instancetype)attributedStringWithString:(NSString *)string
{
  return [[self alloc] initWithString:string];
}

+ (instancetype)attributedStringWithString:(NSString *)string attributes:(NSDictionary *)attributes
{
  return [[self alloc] initWithString:string attributes:attributes];
}

- (void)spx_setAttributes:(NSDictionary *)attributes range:(SPXRange *)range
{
  NSMutableAttributedString *string = self.mutableCopy;
  [string spx_setAttributes:attributes range:range];
}

@end

@implementation NSMutableAttributedString (SPXAdditions)

- (void)spx_setAttributes:(NSDictionary *)attributes range:(SPXRange *)range
{
  [self setAttributes:attributes range:NSMakeRange(range.location, range.length)];
}

@end


