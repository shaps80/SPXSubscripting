# SPXSubscripting

This is a library for adding subscripting support to various Foundation classes. It also adds some interesting solutions to working with NSString's, NSAttributedString's and their attributes.

## Foundation Classes

The following Foundation classes have been extended.

```objc
NSArray
NSOrderedSet
NSMutableOrderedSet
NSMapTable
NSString
NSMutableString
NSAttributedString
NSMutableAttributedString
NSOperationQueue
```

## NSAttributedString

In addition to standard subscripting options, NSAttributed string now provides additional convenience through subscripting.

I've provided a simple shorthand for generating an NSAtributedString:

```objc
NSMutableAttributedString *string = $("Attributed String").mutableCopy;
```

```objc 
NSString *subString = [aString attributedSubstringFromRange:NSMakeRange(0, 10)];

// can now be replaced with

NSString *subString = aString[[@0:10]];
```

You can even use assignments to replace a range:

```objc
NSMutableAttributedString *string = $("a");
[string replaceCharactersInRange:NSMakeRange(0, 1) withAttributedString:[NSAttributedString attributedStringWithString:@"b"]];

// can now be replaced with

string[[@0:1]] = @"b";

// if you want to replace part of a string ((or entirely from a given index), this is even simpler:

string[@0] = @"b";
```

>Notice that NSAttributedString and NSString can now be used interchangeably in most cases.

## NSAttributedString Attributes

So what about attributes? NSAttributedString now has a nice attributes properties that allows you to apply subscripting to your attributes too ;)

```objc
// If you need to replace attributes from a specific index
string.attributes[0] = attributes;

// If you need to add a specific attribute to the entire string
string.attributes[NSKernAttributeName] = @2;

// Thanks for the nicer syntax, you can even add a specific attribute to a range too (add 2.0 kerning to the range {0, 10}
string.attributes[[@0:10:NSKernAttributeName]] = @2;

// Finally you can apply a series of attribuets to a range
string.attributes[[@0:10]] = attributes;
```

## Usage

To run the example project, clone the repo and run the project.

## Installation

SPXSubscripting is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod 'SPXSubscripting'


## License

SPXSubscripting is available under the MIT license. See the LICENSE file for more info.

