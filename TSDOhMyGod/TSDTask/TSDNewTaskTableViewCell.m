//
//  TSDNewTaskTableViewCell.m
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/11.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import "TSDNewTaskTableViewCell.h"
@interface TSDNewTaskTableViewCell()
@end
@implementation TSDNewTaskTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:reuseIdentifier{
    
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
//        _m_imageView = [[UIImageView alloc] init];
//        _m_imageView.contentMode = UIViewContentModeScaleAspectFit;
//        _m_imageView.backgroundColor = [UIColor grayColor];
//        [self.contentView addSubview:_m_imageView];
        
        _m_textField = [[UITextField alloc] init];
        _m_textField.font = [UIFont systemFontOfSize:16];
        _m_textField.returnKeyType = UIReturnKeyDone;
//        _m_textField.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:_m_textField];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat cell_height = CGRectGetHeight(self.contentView.frame);
    CGRect imageFrame = self.imageView.frame;
    CGFloat x = CGRectGetMinX(imageFrame)*2+CGRectGetWidth(imageFrame);
    _m_textField.frame = CGRectMake(x, 0, UScreenWidth-x, cell_height);
    
    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.frame = CGRectMake(0, cell_height-0.6, UScreenWidth, 0.6);
    bottomLine.backgroundColor = RGBColor_Float(0.90, 0.90, 0.90, 1);;
    [self.contentView addSubview:bottomLine];
    NSLog(@"TSDNewTaskTableViewCell layoutSubviews");
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
