//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#define HC_SHORTHAND
#import <OCHamcrest/HCIsEmptyCollection.h>

#import "AbstractMatcherTest.h"
#import "FakeWithCount.h"
#import "FakeWithoutCount.h"


@interface IsEmptyCollectionTest : AbstractMatcherTest
@end


@implementation IsEmptyCollectionTest

- (void)testCopesWithNilsAndUnknownTypes
{
    id matcher = isEmpty();

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testShouldNotMatchNonCollection
{
    assertDoesNotMatch(@"Non collection", isEmpty(), [[NSObject alloc] init]);
}

- (void)testMatchesEmptyCollection
{
    assertMatches(@"empty", isEmpty(), [FakeWithCount fakeWithCount:0]);
}

- (void)testDoesNotMatchesNonEmptyCollection
{
    assertDoesNotMatch(@"non-empty", isEmpty(), [FakeWithCount fakeWithCount:1]);
}

- (void)testDoesNotMatchItemWithoutCount
{
    assertDoesNotMatch(@"no count", isEmpty(), [FakeWithoutCount fake]);
}

- (void)testHasReadableDescription
{
    assertDescription(@"empty collection", isEmpty());
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", isEmpty(), @"bad");
}

- (void)testDescribesMismatch
{
    assertDescribeMismatch(@"was <FakeWithCount>", isEmpty(), [FakeWithCount fakeWithCount:1]);
}

@end
