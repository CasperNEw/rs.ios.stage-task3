#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {

    NSMutableArray <NSString *> *result = @[].mutableCopy;

    NSMutableArray <NSString *> *array1 = @[].mutableCopy;
    [string1 enumerateSubstringsInRange:NSMakeRange(0, string1.length)
                                options:NSStringEnumerationByComposedCharacterSequences
                             usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        [array1 addObject:substring];
    }];

    NSMutableArray <NSString *> *array2 = @[].mutableCopy;
    [string2 enumerateSubstringsInRange:NSMakeRange(0, string2.length)
                                options:NSStringEnumerationByComposedCharacterSequences
                             usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        [array2 addObject:substring];
    }];

    while ([array1 count] > 0 && [array2 count] > 0) {
        if ([array1[0] compare:array2[0] options:NSCaseInsensitiveSearch] == NSOrderedAscending
            || [array1[0] compare:array2[0] options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            [result addObject:array1[0].copy];
            [array1 removeObjectAtIndex:0];
        }
        else
        {
            [result addObject:array2[0].copy];
            [array2 removeObjectAtIndex:0];
        }
    }

    for (int i = 0; i < [array1 count]; i++)
    {
        [result addObject:array1[i].copy];
    }

    for (int i = 0; i < [array2 count]; i++)
    {
        [result addObject:array2[i].copy];
    }

    return [result componentsJoinedByString:@""];
}

@end
