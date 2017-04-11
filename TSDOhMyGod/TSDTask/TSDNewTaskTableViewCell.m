//
//  TSDNewTaskTableViewCell.m
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/11.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import "TSDNewTaskTableViewCell.h"
@interface TSDNewTaskTableViewCell() {
    UIImageView *m_imageView;
    UITextField *m_textField;
}

@end
@implementation TSDNewTaskTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:reuseIdentifier{
    
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        m_imageView = [[UIImageView alloc] init];
        m_imageView.contentMode = UIViewContentModeScaleAspectFit;
        m_imageView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:m_imageView];
        
        m_textField = [[UITextField alloc] init];
        m_textField.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:m_textField];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat cell_height = CGRectGetHeight(self.contentView.frame);
    m_imageView.frame = CGRectMake(0, 0, cell_height, cell_height);
    m_textField.frame = CGRectMake(cell_height, 0, UScreenWidth-cell_height, cell_height);

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
