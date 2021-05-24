#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    NSInteger teamsCount = 0;
    if ([ratingArray count] < 3)
    {
        return  teamsCount;
    }

    for (int i = 0; i < [ratingArray count] - 2; i++)
    {
        for (int j = i + 1; j < [ratingArray count] - 1; j++)
        {
            if (ratingArray[i] > ratingArray[j])
            {
                for (int k = j + 1; k < [ratingArray count]; k++)
                {
                    if (ratingArray[j] > ratingArray[k])
                    {
                        teamsCount += 1;
                    }
                }
            }
            else if (ratingArray[i] < ratingArray[j])
            {
                for (int k = j + 1; k < [ratingArray count]; k++)
                {
                    if (ratingArray[j] < ratingArray[k])
                    {
                        teamsCount += 1;
                    }
                }
            }
        }
    }
    return teamsCount;
}

@end
