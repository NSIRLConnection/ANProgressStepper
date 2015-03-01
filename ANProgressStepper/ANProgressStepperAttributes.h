//
//  ANProgressStepperAttributes.h
//  ANProgressStepper
//
//  Created by Ayush Newatia on 15/02/2015.
//  Copyright (c) 2015 Spectrum. All rights reserved.
//

@protocol ANProgressStepperAttributes <NSObject>

@required

/**
 
 This method configures the view with the total number of steps (circles) in your process.
 
 @return An integer representing the number of circles you would like to appear in the view.
 
*/
- (NSUInteger)numberOfSteps;

/**
 
 Used to set the background colour for the circles for the steps that haven't been completed yet.
 
 @return A UIColor object representing the background color you would like to set.
 
*/
- (UIColor *)incompleteColor;

/**
 
 Used to set the background colour for the circles for the steps that have been completed.
 
 @return A UIColor object representing the background color you would like to set.
 
*/
- (UIColor *)completeColor;

/**
 
 Used to set the background colour for the circles for the step the the user is currently on.
 
 @return A UIColor object representing the background color you would like to set.
 
*/
- (UIColor *)activeColor;

/**
 
 Used to set the border colour of the circles and the colour of the lines (if activated) between the circles.
 
 @return A UIColor object representing the color you would like to set for the border.
 
*/
- (UIColor *)borderColor;

@optional

/**
 
 The thickness of the border/connecting lines can be set with this method. It defaults to 2pt.
 
 @return A CGFloat representing the line thickness in points.
 
*/
- (CGFloat)lineThickness;

/**
 
 In some rare edge cases, the number may not centre itself properly in the circle. If that happens, this method can be used to correct it.
 
 @return A CGFloat specifying the offset value. Positive numbers push the text downwards and negative numbers push it upwards.
 
*/
- (CGFloat)offset;

/**
 
 Specify the size of the numbers inside the circles. The default system font will be used. It will default to half the height of the view if this mehod is not implemented.
 
 @return A CGFloat defining the size of the text in points.
 
*/
- (CGFloat)numberSize;

/**
 
 Specify the font to be used to draw the numbers inside the circles. The default is the system font at half the size of the view's height.
 
 @return A UIFont object defining the font and font size for the numbers.
 
*/
- (UIFont *)numberFont;

/**
 
 The colour of the number in the circle for incomplete steps. Defaults to black.
 
 @return A UIColor object specifying the text colour.
 
*/
- (UIColor *)incompleteNumberColor;

/**
 
 The colour of the number in the circle for complete steps. Defaults to black.
 
 @return A UIColor object specifying the text colour.
 
*/
- (UIColor *)completeNumberColor;

/**
 
 The colour of the number in the circle for the active step. Defaults to black.
 
 @return A UIColor object specifying the text colour.
 
*/
- (UIColor *)activeNumberColor;

/**
 
 A switch the specifies whether or not to show lines connecting the circles.
 
 @return YES will show connecting lines and NO will not.
 
*/
- (BOOL)showLinesBetweenSteps;

@end