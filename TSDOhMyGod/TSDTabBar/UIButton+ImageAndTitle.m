//
//  UIButton+ImageAndTitle.m
//  MyDemo
//
//  Created by Tiya on 2017/3/29.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import "UIButton+ImageAndTitle.h"

@implementation UIButton (ImageAndTitle)
- (void)verticalImageAndTitle
{
    self.titleLabel.backgroundColor = [UIColor clearColor];
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, -imageSize.height - 8, 0);
    self.imageEdgeInsets = UIEdgeInsetsMake(-titleSize.height+2, 0, 0, -titleSize.width);
    NSLog(@"title edge top:%f,left:%f,bottom:%f,right:%f",self.titleEdgeInsets.top,self.titleEdgeInsets.left,self.titleEdgeInsets.bottom,self.titleEdgeInsets.right);
    NSLog(@"image edge top:%f,left:%f,bottom:%f,right:%f",self.imageEdgeInsets.top,self.imageEdgeInsets.left,self.imageEdgeInsets.bottom,self.imageEdgeInsets.right);
}
@end
