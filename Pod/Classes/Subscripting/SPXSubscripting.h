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

@class SPXRange;


@interface NSArray (SPXSubscriptingAdditions)

/**
 *  Returns an array of objects within specified range
 *
 *  @param rangeValue The range to return
 */
- (NSArray *)objectForKeyedSubscript:(SPXRange *)rangeValue;

@end

@interface NSOrderedSet (SPXSubscriptingAdditions)

/**
 *  Returns the object at the specified index
 *
 *  @param index The index of the obejct to return
 */
- (id)objectAtIndexedSubscript:(NSUInteger)index;

/**
 *  Returns an array of objects within specified range
 *
 *  @param rangeValue The range to return
 */
- (NSArray *)objectForKeyedSubscript:(SPXRange *)rangeValue;

@end

@interface NSMutableOrderedSet (SPXSubscriptingAdditions)

/**
 *  Sets the object at the specified index
 *
 *  @param object The object to set
 *  @param index  The index in the set
 */
- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index;

/**
 *  Replaces the objects within the specified range. Equivalent to calling -replaceObjectsAtIndexes:withObjects:
 *
 *  @param objects    The new objects to insert
 *  @param rangeValue The range to replace
 */
- (void)setObject:(NSArray *)objects forKeyedSubscript:(SPXRange *)rangeValue;

@end

@interface NSMapTable (SPXSubscriptingAdditions)

/**
 *  Sets the specified object for the specified key
 *
 *  @param object The object to set
 *  @param key    The key this object will be associated by
 */
- (void)setObject:(id)object forKeyedSubscript:(id)key;

/**
 *  Returns the object for the specified key
 *
 *  @param key The key of the object to return
 */
- (id)objectForKeyedSubscript:(id)key;

@end

@interface NSString (SPXSubscriptingAdditions)

/**
 *  Returns the objects within the specified range
 *
 *  @param rangeValue The range to return
 */
- (NSString *)objectForKeyedSubscript:(SPXRange *)rangeValue;

/**
 *  Returns the object at the specified index
 *
 *  @param index The index of the object to return
 */
- (NSString *)objectAtIndexedSubscript:(NSUInteger)index;

@end

@interface NSMutableString (SPXSubscriptingAdditions)

/**
 *  Replaces the string within the specified range
 *
 *  @param string     The string to insert
 *  @param rangeValue The range to replace
 */
- (void)setObject:(NSString *)string forKeyedSubscript:(SPXRange *)rangeValue;

/**
 *  Inserts the string at the specified index
 *
 *  @param string The string to insert
 *  @param index  The index where this string should be inserted
 */
- (void)setObject:(NSString *)string atIndexedSubscript:(NSUInteger)index;

@end

@interface NSAttributedString (SPXSubscriptingAdditions)

/**
 *  Returns the NSAttributedString within the specified range
 *
 *  @param rangeValue The range to return
 */
- (NSAttributedString *)objectForKeyedSubscript:(SPXRange *)rangeValue;

/**
 *  Returns the NSAttributedString from the specified index. Equivalent to calling -attributedSubstringFromRange:
 *
 *  @param index The index representing the location to begin from
 */
- (NSAttributedString *)objectAtIndexedSubscript:(NSUInteger)index;

@end

@interface NSMutableAttributedString (SPXSubscriptingAdditions)

/**
 *  Replaces the string within the specified range. You can pass either an NSString or an NSAttributedString.
 *
 *  @param string     The string or attributed string to insert
 *  @param rangeValue The range to replace
 */
- (void)setObject:(id)string forKeyedSubscript:(SPXRange *)rangeValue;

/**
 *  Inserts the string within the specified range. You can pass either an NSString or an NSAttributedString.
 *
 *  @param string The string or attributed string to insert
 *  @param index  The index where this string should be inserted
 */
- (void)setObject:(id)string atIndexedSubscript:(NSUInteger)index;

@end

@interface NSOperationQueue (SPXSubscriptingAdditions)

/**
 *  Returns the NSOperation a the specified index
 *
 *  @param index The index of the operation to return
 */
- (NSOperation *)objectAtIndexedSubscript:(NSUInteger)index;

@end



