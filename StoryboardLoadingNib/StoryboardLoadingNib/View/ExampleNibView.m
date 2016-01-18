//
//  ExampleView.m
//  StoryboardLoadingNib
//
//  Created by Dan Zinngrabe on 1/18/16.
//  Copyright © 2016 Dan Zinngrabe. All rights reserved.
//

#import "ExampleNibView.h"

@interface ExampleNibView ()

/**
 *  Strong because this outlet is connected to File's Owner in the nib.
 */

@property (nonatomic, readwrite, strong)      IBOutlet    UIView  *contentView;
@end

@implementation ExampleNibView
@synthesize contentView =   _contentView;

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])){
        [self initializeSubviews];
    }
    return self;
}

#pragma mark - Private Methods

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
