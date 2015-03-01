//
//  ViewController.m
//  ANProgressStepper
//
//  Created by Ayush Newatia on 15/02/2015.
//  Copyright (c) 2015 Spectrum. All rights reserved.
//

#import "ViewController.h"
#import "ANProgressStepper.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet ANProgressStepper *stepper;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSUInteger)numberOfSteps
{
    return 5;
}

- (CGFloat)lineThickness
{
    return 2.0f;
}

- (UIColor *)incompleteColor
{
    return [UIColor blackColor];
}

- (UIColor *)completeColor
{
    return [UIColor greenColor];
}

- (UIColor *)activeColor
{
    return [UIColor redColor];
}

- (UIColor *)incompleteNumberColor
{
    return [UIColor whiteColor];
}

- (UIColor *)completeNumberColor
{
    return [UIColor blackColor];
}

- (UIColor *)activeNumberColor
{
    return [UIColor whiteColor];
}

- (UIColor *)borderColor
{
    return [UIColor blueColor];
}

- (CGFloat)numberSize
{
    return 11.0f;
}

- (BOOL)showLinesBetweenSteps
{
    return NO;
}

@end
