//
//  ViewController.m
//  TTAppCoreGraphing
//
//  Created by Tim Bellay on 5/19/15.
//  Copyright (c) 2015 Mission Minds. All rights reserved.
//

#import "ViewController.h"
#import "APCLineGraphView.h"
#import <stdlib.h>

@interface ViewController () <APCBaseGraphViewDelegate, APCLineGraphViewDataSource>//, APCLineGraphViewDelegate>

@property (nonatomic, strong) NSArray *dataX;
@property (nonatomic, strong) NSArray *dataY;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	
	APCLineGraphView *graphView =  [[APCLineGraphView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 400)];
	graphView.datasource = self;
	graphView.delegate = self;
	
	[graphView layoutSubviews];
	
	[self.view addSubview:graphView];
	
	
	NSMutableArray *xData = [[NSMutableArray alloc] initWithCapacity:20];
	for (int i = 0; i < 20; i ++) {
		[xData addObject: [NSNumber numberWithInt:90+arc4random_uniform(10)]];
	}
	self.dataX = [xData copy];

	NSMutableArray *yData = [[NSMutableArray alloc] initWithCapacity:20];
	for (int i = 0; i < 20; i ++) {
		[yData addObject: [NSNumber numberWithInt:90+arc4random_uniform(10)]];
	}
	self.dataY = [yData copy];
	
	[graphView refreshGraph];
}

- (NSInteger)numberOfPlotsInLineGraph:(APCLineGraphView *)graphView {
	return 2;
}

- (NSInteger)lineGraph:(APCLineGraphView *)graphView numberOfPointsInPlot:(NSInteger)plotIndex {
	if (plotIndex == 0)
		return self.dataX.count;
	else if (plotIndex == 1)
		return self.dataY.count;
	else
		return 0;
}

- (CGFloat)lineGraph:(APCLineGraphView *)graphView plot:(NSInteger)plotIndex valueForPointAtIndex:(NSInteger)pointIndex {
	if (plotIndex == 0)
		return [self.dataX[pointIndex] floatValue];
	else if (plotIndex == 1)
		return [self.dataY[pointIndex] floatValue];
	else
		return 0;
}

@end