//
//  MyView.m
//  UIViewLiveRender
//
//  Created by RonnieRen on 11/24/15.
//  Copyright © 2015 RonnieRen. All rights reserved.
//

#import "MyView.h"



@interface MyView ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@property(nonatomic) IBInspectable NSString* buttonTitle;

@end


@implementation MyView

- (NSString*)buttonTitle {
    return [self.button titleForState:UIControlStateNormal];
}

- (void)setButtonTitle:(NSString *)buttonTitle {
    [self.button setTitle:buttonTitle forState:UIControlStateNormal];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [self loadViewFromNib];
    }
    return self;
}


- (nullable id)awakeAfterUsingCoder:(NSCoder *)aDecoder {
    self = [super awakeAfterUsingCoder:aDecoder];
    if (self) {
        if (self.subviews.count == 0) {
            self = [self loadViewFromNib];
            
        }
    }
    return self;
}

- (MyView*)loadViewFromNib {
    NSBundle* bundle = [NSBundle bundleForClass:[self class]];
    NSArray* views = [bundle loadNibNamed:@"MyView" owner:nil options:nil];
    MyView* newView = views[0];
    newView.bounds = self.bounds;
    newView.frame = self.frame;
    newView.autoresizingMask = UIViewAutoresizingNone;
    return newView;
}
@end
