#import "LevelOrderTraversal.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    NSMutableArray *order = [NSMutableArray new];

    if ([tree count] == 0)
    {
        return order;
    }

    if ([tree[0] isKindOfClass:NSNumber.class])
    {
        NSMutableArray *rootArray = [[NSMutableArray alloc] initWithArray:@[tree[0]]];
        [order insertObject:rootArray atIndex:0];
    } else {
        return order;
    }

    NSMutableArray *checkPoints = [[NSMutableArray alloc] initWithObjects:@0, nil];
    NSInteger currentLevel = 0;
    for (int i = 1; i < [tree count]; i++)
    {
        if ([[checkPoints lastObject] isEqualToNumber:[NSNumber numberWithInt:(int)currentLevel]])
        {
            [checkPoints removeLastObject];
        }
        else
        {
            [checkPoints addObject:[NSNumber numberWithInt:(int)currentLevel]];
        }

        if ([tree[i] isKindOfClass:NSNumber.class])
        {
            currentLevel += 1;
            if ([order count] > currentLevel)
            {
                [order[currentLevel] addObject:tree[i]];
            }
            else
            {
                NSMutableArray *levelArray = [[NSMutableArray alloc] initWithArray:@[tree[i]]];
                [order addObject:levelArray];
            }
        }
        else
        {
            currentLevel = [[checkPoints lastObject] integerValue];
        }
    }

    return order;
}
