

#define MAXVALUE 100

#define COUNTOFWAVEVIEWS 10

#import "ViewController.h"
#import "WaveView.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *waveViews;

@end

@implementation ViewController

- (NSMutableArray *)waveViews
{
    if (_waveViews == nil)
    {
        _waveViews = [NSMutableArray array];
    }
    return _waveViews;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
    for (int i = 0;  i < COUNTOFWAVEVIEWS; i++)
    {
        CGFloat x = 0;
        CGFloat y = [UIScreen mainScreen].bounds.size.height / COUNTOFWAVEVIEWS * i;
        CGFloat w = self.view.bounds.size.width;
        CGFloat h = [UIScreen mainScreen].bounds.size.height / COUNTOFWAVEVIEWS;
        
        WaveView *waveView = [[WaveView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        
        waveView.backgroundColor = [UIColor whiteColor];
        
        [self.waveViews addObject:waveView];
        
        [self.view addSubview:waveView];
    }

    [NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(changeWaveView) userInfo:nil repeats:YES];
}

- (void)changeWaveView
{
    
    
    for (int i = 0; i < COUNTOFWAVEVIEWS; i++)
    {
        unsigned int random = arc4random_uniform(MAXVALUE);
        
        WaveView *waveView = (WaveView *)self.waveViews[i];
        
        [waveView refreshWaveWithValue:random];
    }
    
}


@end
