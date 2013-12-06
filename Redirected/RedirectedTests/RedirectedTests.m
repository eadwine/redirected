//
//  RedirectedTests.m
//  RedirectedTests
//
//  Created by Edvinas on 06/12/13.
//  Copyright (c) 2013 Edvinas Sabaliauskas. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface RedirectedTests : XCTestCase

@end

@implementation RedirectedTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
