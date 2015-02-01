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

#import "SPXSubscripting.h"
#import "NSAttributedString+SPXAdditions.h"
#import "SPXRange.h"

@implementation NSArray (SPXSubscriptingAdditions)

- (NSArray *)objectForKeyedSubscript:(NSValue *)rangeValue
{
  NSRange range = [rangeValue rangeValue];
  
  if (range.length == 0) {
    range.length = self.count - range.location;
  }
  
  return [self subarrayWithRange:NSMakeRange(range.location, range.length)];
}

@end

@implementation NSOrderedSet (SPXSubscriptingAdditions)

- (id)objectAtIndexedSubscript:(NSUInteger)index
{
  return [self objectAtIndex:index];
}

- (NSArray *)objectForKeyedSubscript:(SPXRange *)rangeValue
{
  return [self objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(rangeValue.location, rangeValue.length)]];
}

@end

@implementation NSMutableOrderedSet (SPXSubscriptingAdditions)

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index
{
  [self setObject:object atIndex:index];
}

- (void)setObject:(NSArray *)objects forKeyedSubscript:(SPXRange *)rangeValue
{
  [self replaceObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(rangeValue.location, rangeValue.length)] withObjects:objects];
}

@end

@implementation NSMapTable (SPXSubscriptingAdditions)

- (id)objectForKeyedSubscript:(id)key
{
  return [self objectForKey:key];
}

- (void)setObject:(id)object forKeyedSubscript:(id)key
{
  [self setObject:object forKey:key];
}

@end

@implementation NSString (SPXSubscriptingAdditions)

- (NSString *)objectForKeyedSubscript:(NSValue *)rangeValue
{
  return [self substringWithRange:[rangeValue rangeValue]];
}

- (NSString *)objectAtIndexedSubscript:(NSUInteger)index
{
  return [self substringFromIndex:index];
}

@end


@implementation NSMutableString (SPXSubscriptingAdditions)

- (void)setObject:(NSString *)string atIndexedSubscript:(NSUInteger)index
{
  [self insertString:string atIndex:index];
}

- (void)setObject:(NSString *)string forKeyedSubscript:(NSValue *)rangeValue
{
  [self replaceCharactersInRange:[rangeValue rangeValue] withString:string];
}

@end


@implementation NSAttributedString (SPXSubscriptingAdditions)

- (NSAttributedString *)objectAtIndexedSubscript:(NSUInteger)index
{
  return [self attributedSubstringFromRange:NSMakeRange(index, self.length - index - 1)];
}

- (NSAttributedString *)objectForKeyedSubscript:(NSValue *)rangeValue
{
  return [self attributedSubstringFromRange:[rangeValue rangeValue]];
}

@end


@implementation NSMutableAttributedString (SPXSubscriptingAdditions)

- (void)setObject:(id)string atIndexedSubscript:(NSUInteger)index
{
  NSAttributedString *attributedString = string;
  
  if ([string isKindOfClass:[NSString class]]) {
    attributedString = [NSAttributedString attributedStringWithString:string];
  }
  
  [self insertAttributedString:attributedString atIndex:index];
}

- (void)setObject:(id)string forKeyedSubscript:(NSValue *)rangeValue
{
  NSAttributedString *attributedString = string;
  
  if ([string isKindOfClass:[NSString class]]) {
    attributedString = [NSAttributedString attributedStringWithString:string];
  }

  [self replaceCharactersInRange:[rangeValue rangeValue] withAttributedString:attributedString];
}

@end

@implementation NSOperationQueue (SPXSubscriptingAdditions)

- (NSOperation *)objectAtIndexedSubscript:(NSUInteger)index
{
  return self.operations[index];
}

@end




