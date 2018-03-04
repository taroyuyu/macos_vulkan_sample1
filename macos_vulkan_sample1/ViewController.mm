#import "ViewController.h"
#import "VKView.h"
#include "VKApplication.hpp"

static CVReturn displayCallback(CVDisplayLinkRef displayLink,
                                const CVTimeStamp *inNow,
                                const CVTimeStamp *inOutputTime,
                                CVOptionFlags flagsIn,
                                CVOptionFlags *flagsOut,
                                void *displayLinkContext)
{
  vk::HelloTriangleApplication *app = (vk::HelloTriangleApplication *)displayLinkContext;
  dispatch_async(dispatch_get_main_queue(), ^{
    app->mainLoop();
  });
  return kCVReturnSuccess;
}

@interface ViewController () <VKViewDelegate>
@property (nonatomic, assign) vk::HelloTriangleApplication app;
@property (nonatomic, assign) CVDisplayLinkRef displayLink;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)viewDidAppear {
  [super viewDidAppear];
  
  VKView *view = (VKView *)self.view;
  view.delegate = self;
  CGRect rect = [view convertRectToBacking:view.frame];
  
  _app.setViewSize(rect.size.width, rect.size.height);
  _app.setView((__bridge void *)view);
  _app.initVulkan();
  
  [self createDisplayLink];
}

- (void)viewDidDisappear {
  [super viewDidDisappear];
  CVDisplayLinkStop(_displayLink);
  CVDisplayLinkRelease(_displayLink);
  _app.cleanup();
}

- (void)createDisplayLink
{
  CGDirectDisplayID displayID = CGMainDisplayID();
  CVReturn error = CVDisplayLinkCreateWithCGDisplay(displayID, &_displayLink);
  if (error == kCVReturnSuccess) {
    CVDisplayLinkSetOutputCallback(_displayLink, displayCallback, (void *)(&_app));
    CVDisplayLinkStart(_displayLink);
  }
  else {
    NSLog(@"Display Link created with error: %d", error);
    _displayLink = nil;
  }
}

- (void)vkView:(VKView *)vkView didChangeSize:(NSSize)size {
  CGRect rect = [vkView convertRectToBacking:CGRectMake(0, 0, size.width, size.height)];
  _app.setViewSize(rect.size.width, rect.size.height);
}

@end
