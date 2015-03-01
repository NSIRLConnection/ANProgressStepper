//
//  ANProgressStepper.m
//  ANProgressStepper
//
//  Created by Ayush Newatia on 15/02/2015.
//  Copyright (c) 2015 Spectrum. All rights reserved.
//

#import "ANProgressStepper.h"

@interface ANProgressStepper()

@property (nonatomic, strong) NSParagraphStyle *paragraphStyle;
@property (nonatomic, strong) UIFont *font;

@property (nonatomic, strong) UIColor *incompleteColor;
@property (nonatomic, strong) UIColor *completeColor;
@property (nonatomic, strong) UIColor *activeColor;

@property (nonatomic, strong) UIColor *incompleteNumberColor;
@property (nonatomic, strong) UIColor *completeNumberColor;
@property (nonatomic, strong) UIColor *activeNumberColor;

@property (nonatomic) CGFloat offset;
@property (nonatomic) CGFloat lineThickness;

@end

@implementation ANProgressStepper

- (void)drawRect:(CGRect)rect
{
    CGFloat borderThickness = self.lineThickness;
    
    CGFloat x = rect.origin.x+borderThickness;
    CGFloat y = rect.origin.y+borderThickness;
    CGFloat height = rect.size.height-(borderThickness*2);
    CGFloat width = rect.size.width-(borderThickness*2);
    
    CGFloat step = [self stepSize:CGRectMake(x, y, width, height)];

    for (int i = 0; i < [self.attributes numberOfSteps]; i++)
    {
        UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(x+(step*i), y, height, height)];
        circlePath.lineWidth = self.lineThickness;
        [[self.attributes borderColor] setStroke];
        UIColor *numberColor = nil;
        
        if (i < self.currentStep)
        {
            [self.completeColor setFill];
            numberColor = self.completeNumberColor;
        }
        else if (i == self.currentStep)
        {
            [self.activeColor setFill];
            numberColor = self.activeNumberColor;
        }
        else
        {
            [self.incompleteColor setFill];
            numberColor = self.incompleteNumberColor;
        }
        
        [circlePath stroke];
        [circlePath fill];
        
        NSString *textContent = [NSString stringWithFormat:@"%d",(i+1)];
        
        NSDictionary *attrs = @{NSFontAttributeName:self.font,
                                NSForegroundColorAttributeName:numberColor,
                                NSParagraphStyleAttributeName:self.paragraphStyle};
        
        [textContent drawInRect:CGRectMake(x+(step*i), ceil((height-self.font.pointSize)/2+self.offset), height, self.font.pointSize)
                 withAttributes:attrs];
        
        
        if ([self.attributes showLinesBetweenSteps])
        {
            if (i < [self.attributes numberOfSteps]-1)
            {
                UIBezierPath *bezierPath = UIBezierPath.bezierPath;
                bezierPath.lineWidth = [self.attributes lineThickness];
                [bezierPath moveToPoint:CGPointMake(x+(step*i)+height, y+(height/2))];
                [bezierPath addLineToPoint:CGPointMake(x+(step*(i+1)), y+(height/2))];
                [[self.attributes borderColor] setStroke];
                [bezierPath stroke];
            }
        }
    }
}


- (CGFloat)stepSize:(CGRect)rect
{
    CGFloat height = rect.size.height;
    CGFloat width = rect.size.width;
    
    return (width-height)/([self.attributes numberOfSteps]-1);
}


- (void)setCurrentStep:(NSUInteger)currentStep
{
    _currentStep = currentStep - 1;
}


- (UIColor *)defaultNumberColor
{
    return [UIColor blackColor];
}

# pragma mark - Lazy Getters

- (NSParagraphStyle *)paragraphStyle
{
    if (!_paragraphStyle)
    {
        NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        [style setAlignment:NSTextAlignmentCenter];
        _paragraphStyle = style;
    }
    return _paragraphStyle;
}

- (UIFont *)font
{
    if (!_font)
    {
        if ([self.attributes respondsToSelector:@selector(numberFont)])
        {
            _font = [self.attributes numberFont];
        }
        else if ([self.attributes respondsToSelector:@selector(numberSize)])
        {
            _font = [UIFont systemFontOfSize:[self.attributes numberSize]];
        }
        else
        {
            _font = [UIFont systemFontOfSize:self.bounds.size.height/2];
        }
    }
    return _font;
}

- (UIColor *)incompleteColor
{
    if (!_incompleteColor)
    {
        _incompleteColor = [self.attributes incompleteColor];
    }
    return _incompleteColor;
}

- (UIColor *)incompleteNumberColor
{
    if (!_incompleteNumberColor)
    {
        if ([self.attributes respondsToSelector:@selector(incompleteNumberColor)])
        {
            _incompleteNumberColor = [self.attributes incompleteNumberColor];
        }
        else
        {
            _incompleteNumberColor = [self defaultNumberColor];
        }
    }
    return _incompleteNumberColor;
}

- (UIColor *)completeColor
{
    if (!_completeColor)
    {
        _completeColor = [self.attributes completeColor];
    }
    return _completeColor;
}

- (UIColor *)completeNumberColor
{
    if (!_completeNumberColor)
    {
        if ([self.attributes respondsToSelector:@selector(completeNumberColor)])
        {
            _completeNumberColor = [self.attributes completeNumberColor];
        }
        else
        {
            _completeNumberColor = [self defaultNumberColor];
        }
    }
    return _completeNumberColor;
}

- (UIColor *)activeColor
{
    if (!_activeColor)
    {
        _activeColor = [self.attributes activeColor];
    }
    return _activeColor;
}

- (UIColor *)activeNumberColor
{
    if (!_activeNumberColor)
    {
        if ([self.attributes respondsToSelector:@selector(activeNumberColor)])
        {
            _activeNumberColor = [self.attributes activeNumberColor];
        }
        else
        {
            _activeNumberColor = [self defaultNumberColor];
        }
    }
    return _activeNumberColor;
}

- (CGFloat)lineThickness
{
    if (!_lineThickness)
    {
        if ([self.attributes respondsToSelector:@selector(lineThickness)])
        {
            _lineThickness = [self.attributes lineThickness];
        }
        else
        {
            _lineThickness = 2.0f;
        }
    }
    return _lineThickness;
}

- (CGFloat)offset
{
    if (!_offset)
    {
        if ([self.attributes respondsToSelector:@selector(offset)])
        {
            _offset = [self.attributes offset];
        }
        else
        {
            _offset = 0.0f;
        }
    }
    return _offset;
}


@end
