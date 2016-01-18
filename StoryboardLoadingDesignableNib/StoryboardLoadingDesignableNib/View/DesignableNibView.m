//
//  DesignableNibView.m
//  StoryboardLoadingDesignableNib
//
//  Created by Dan Zinngrabe on 1/18/16.
//  Copyright © 2016 Dan Zinngrabe. All rights reserved.
//

#import "DesignableNibView.h"

@interface DesignableNibView ()
/**
 *  Strong because this outlet is connected to File's Owner in the nib.
 */

@property (nonatomic, readwrite, strong)      IBOutlet    UIView  *contentView;

@property (nonatomic, readwrite, weak)  IBOutlet    UILabel *textLabel;
@end

@implementation DesignableNibView
@dynamic text;

/**
 * The Interface Builder preview renderer calls initWithFrame: to create the preview.
 *
 */

- (instancetype) initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])){
        [self initializeSubviews];
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])){
        [self initializeSubviews];
    }
    return self;
}

/**
 *  The property implementation just passes through to the private UILabel.
 *
 */

- (void) setText:(NSString *)text {
    [[self textLabel] setText:[text copy]];
}

- (NSString *) text {
    return [[[self textLabel] text] copy];
}

#pragma mark - Private methods

/**
 *  In the nib:
 *  File's Owner is set to ExampleNibView
 *  contentView outlet from File's Owner is connected to Content View
 *  This is very similar to how UITableViewCell/UICollectionViewCell nibs are structured.
 */

- (void) initializeSubviews {
    NSArray     *nibItems   = nil;
    NSString    *nibName    = NSStringFromClass([self class]);
    UINib       *nib        = [UINib nibWithNibName:nibName bundle:[NSBundle bundleForClass:[self class]]];
    nibItems = [nib instantiateWithOwner:self options:nil];
    
    //Add the view loaded from the nib into self.
    [self setContentView:[nibItems firstObject]];
    if ([self contentView] != nil){
        // Set an initial bounds, autolayout will do the rest.
        [[self contentView] setFrame:[self bounds]];
        [self addSubview:[self contentView] ];
    }
}

@end
