#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    NSString *dateString = [NSString stringWithFormat:@"%lu", (unsigned long)monthNumber];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [dateFormatter setDateFormat:@"M"];
    NSDate *dateFromString = [dateFormatter dateFromString:dateString];
    [dateFormatter setDateFormat:@"MMMM"];
    NSString *month = [dateFormatter stringFromDate:dateFromString];
    return month;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *dateFromString = [dateFormatter dateFromString:date];
    [dateFormatter setDateFormat:@"d"];
    NSString *dayString = [dateFormatter stringFromDate:dateFromString];
    return  dayString.integerValue;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    [dateFormatter setDateFormat:@"EEEEEE"];
    NSString *day = [dateFormatter stringFromDate:date];
    return day;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    cal.firstWeekday = 2;

    NSDate *now = [NSDate date];
    NSDate *startOfTheWeek;
    NSDate *endOfWeek;
    NSTimeInterval interval;
    [cal rangeOfUnit:NSCalendarUnitWeekOfYear
           startDate:&startOfTheWeek
            interval:&interval
             forDate:now];

    endOfWeek = [startOfTheWeek dateByAddingTimeInterval:interval - 1];

    [cal rangeOfUnit:NSCalendarUnitDay
           startDate:&endOfWeek
            interval:NULL
             forDate:endOfWeek];

    return [date laterDate:startOfTheWeek] && [date earlierDate:endOfWeek];
}

@end
