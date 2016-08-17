

#define MAXVALUE 100

#define ACCURACY 1

#import "WaveView.h"

@interface WaveView ()

@property (nonatomic, assign) CGFloat currentX;

@property (nonatomic, assign) CGFloat nextX;

@property (nonatomic, assign) CGFloat currentValue;

@property (nonatomic, assign) CGFloat nextValue;

@property (nonatomic, strong) UIImage *lastImage;

@end

@implementation WaveView

- (void)refreshWaveWithValue:(float)value
{
    if (self.currentX >= self.bounds.size.width)
    {
        self.currentX = 0.0;
        
        self.nextX = ACCURACY;
    }
    else
    {
        self.currentX += ACCURACY;
        
        self.nextX = self.currentX + ACCURACY;
    }
    
    self.nextValue = value;
    
    [self draw];
    
    [self setNeedsDisplay];
}

- (void)draw
{
    
    UIGraphicsBeginImageContext(self.bounds.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ctx, self.currentX, self.currentValue / MAXVALUE * self.bounds.size.height);
    
    CGContextAddLineToPoint(ctx, self.nextX, self.nextValue / MAXVALUE * self.bounds.size.height);
    
    CGContextSetLineWidth(ctx, 1);
    
    CGContextSetInterpolationQuality(ctx, kCGInterpolationNone);
    
    CGContextDrawPath(ctx, kCGPathStroke);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    [newImage drawInRect:self.bounds];
    
    [self.lastImage drawInRect:self.bounds];
    
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    
    if (self.currentX >= self.bounds.size.width || self.currentX == 0)
    {
        self.lastImage = nil;
    }
    else
    {
        self.lastImage = self.image;
    }
    
    UIGraphicsEndImageContext();
    
    self.currentX = self.nextX;
    
    self.currentValue = self.nextValue;
    
    
}



@end
