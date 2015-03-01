//
//  ANProgressStepper.h
//  ANProgressStepper
//
//  Created by Ayush Newatia on 15/02/2015.
//  Copyright (c) 2015 Spectrum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ANProgressStepperAttributes.h"

@interface ANProgressStepper : UIView

/**
 
 The class that conforms to the ANProgessStepperAttributes protocol. This can be set in Interface Builder.
 
*/
@property (strong, nonatomic) IBOutlet id<ANProgressStepperAttributes> attributes;

/**
 
 The current active step can be set using this property.
 
*/
@property (nonatomic) NSUInteger currentStep;

@end
