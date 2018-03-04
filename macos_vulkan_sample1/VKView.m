#import <QuartzCore/QuartzCore.h>
#import "VKView.h"

@implementation VKView

- (instancetype)initWithCoder:(NSCoder *)decoder {
  self = [super initWithCoder:decoder];
  if (self) {
    self.wantsLayer = YES;
    self.layerContentsRedrawPolicy = NSViewLayerContentsRedrawOnSetNeedsDisplay;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(viewResized:)
                                                 name:NSViewFrameDidChangeNotification
                                               object:self];
  }
  return self;
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (CALayer *)makeBackingLayer {
  CAMetalLayer *layer = [CAMetalLayer layer];
  CGSize viewScale = [self convertSizeToBacking:CGSizeMake(1.0, 1.0)];
  layer.contentsScale = MIN(viewScale.width, viewScale.height);
  return layer;
}

- (void)viewDidEndLiveResize {
  [super viewDidEndLiveResize];
  
  [self.delegate vkView:self didChangeSize:self.frame.size];
}

- (void)viewResized:(NSNotification *)notification {
  if (![self inLiveResize]) {
    [self.delegate vkView:self didChangeSize:self.frame.size];
  }
}

@end
