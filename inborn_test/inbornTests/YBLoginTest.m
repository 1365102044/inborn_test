//
//  YBLoginTest.m
//  inborn
//
//  Created by 刘文强 on 2017/6/1.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YBLoginViewController.h"
@interface YBLoginTest : XCTestCase

@property(nonatomic,strong) YBLoginViewController * loginVC;
@end

@implementation YBLoginTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.loginVC = [YBLoginViewController creatLoginViewControllerWithType:generalLoginType extend:nil];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testLogin
{
    
}
@end
