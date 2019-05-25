#import <UIKit/UIKit.h>

@interface ItemsViewController
@property (assign, nonatomic) BOOL ___didMarkAllAsRead;
@end

%hook ItemsViewController
%property (assign, nonatomic) BOOL ___didMarkAllAsRead;

- (void)markAllRead:(id)arg1 forceConfirmation:(BOOL)arg2
{
    if (self.___didMarkAllAsRead) { return; }

    self.___didMarkAllAsRead = YES;
    %orig(arg1, NO);

    // taptic
    UIImpactFeedbackGenerator *fb = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
    [fb impactOccurred];
    [fb release];
}

- (void)slidingController:(id)arg1 didSnapToViewController:(id)arg2
{
    self.___didMarkAllAsRead = NO;
    %orig;
}
%end

