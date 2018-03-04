#import <Cocoa/Cocoa.h>

@class VKView;

@protocol VKViewDelegate
- (void)vkView:(VKView *)vkView didChangeSize:(NSSize)size;
@end

@interface VKView : NSView
@property (nonatomic, weak) id<VKViewDelegate> delegate;
@end
