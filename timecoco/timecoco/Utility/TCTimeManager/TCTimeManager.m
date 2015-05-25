//
//  TCTimeManager.m
//  timecoco
//
//  Created by Hong Xie on 19/3/15.
//  Copyright (c) 2015 timecoco. All rights reserved.
//

#import "TCTimeManager.h"

@implementation TCTimeManager

+ (NSInteger)getSecondValue:(TCDairy *)dairy {
    NSInteger secondValue = 0;
    secondValue = (NSInteger)dairy.pointTime % T_MINUTE;
    return secondValue;
}

+ (NSInteger)getMinuteValue:(TCDairy *)dairy {
    NSInteger minuteValue = 0;
    minuteValue = ((NSInteger)dairy.pointTime % T_HOUR) / T_MINUTE;
    return minuteValue;
}

+ (NSInteger)getHourValue:(TCDairy *)dairy {
    NSInteger hourValue = 0;
    hourValue = (dairy.timeZoneOffsetInterval % T_DAY) / T_HOUR;
    return hourValue;
}

+ (NSInteger)yearOrderSince1970:(TCDairy *)dairy {
    NSInteger order = (dairy.timeZoneOffsetInterval / T_DAY - 4) / 7;
    return order;
}

+ (NSInteger)weekOrderSince1970:(TCDairy *)dairy {
    NSInteger order = (dairy.timeZoneOffsetInterval / T_DAY + 3) / 7;
    return order;
}

+ (BOOL)estimateWeekend:(TCDairy *)dairy {
    NSInteger order = [self dayOrderInWeek:dairy];
    return (order == 5) || (order == 6); //基于1970年1月1日星期四，算出如果余数=5或者=6时，为周六和周天
}

+ (NSInteger)dayOrderInWeek:(TCDairy *)dairy {
    NSInteger order = (dairy.timeZoneOffsetInterval / T_DAY + 3) % 7;
    return order;
}

@end
