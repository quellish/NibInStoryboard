//
//  DesignableNibView.h
//  StoryboardLoadingDesignableNib
//
//  Created by Dan Zinngrabe on 1/18/16.
//  Copyright © 2016 Dan Zinngrabe. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Demonstates a custom UIView loaded from a nib that can be used in a storyboard, with preview and customization directly in Interface Builder.
 *
 */

IB_DESIGNABLE
@interface DesignableNibView : UIView

/**
 *  The text of the view.
 */

@property   (nonatomic, readwrite, copy)    IBInspectable   NSString    *text;

@end
