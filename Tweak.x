#import <UIKit/UIKit.h>

static BOOL bypassOn = NO;
static BOOL antenaOn = NO;

%hook UIWindow
- (void)layoutSubviews {
    %orig;
    if (self.gestureRecognizers.count == 0) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(abrirLiam:)];
        tap.numberOfTapsRequired = 2;
        tap.numberOfTouchesRequired = 3;
        [self addGestureRecognizer:tap];
    }
}

%new
- (void)abrirLiam:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"LIAM MENU" message:@"Opciones:" preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:(bypassOn ? @"Bypass: ON" : @"Bypass: OFF") style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            bypassOn = !bypassOn;
        }]];
        
        [alert addAction:[UIAlertAction actionWithTitle:(antenaOn ? @"Antena: ON" : @"Antena: OFF") style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            antenaOn = !antenaOn;
        }]];

        [alert addAction:[UIAlertAction actionWithTitle:@"CERRAR" style:UIAlertActionStyleCancel handler:nil]];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    }
}
%end
