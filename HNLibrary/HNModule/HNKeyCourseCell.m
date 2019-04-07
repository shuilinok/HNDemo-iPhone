//
//  HNKeyCourseCell.m
//  HNDemo-iPhone
//
//  Created by shuilin on 3/31/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "HNKeyCourseCell.h"

@interface HNKeyCourseCell ()

@property (strong, nonatomic) IBOutlet UILabel *courseTitleLabel;

@property (strong, nonatomic) IBOutlet UILabel *courseDescLabel;

@property (strong, nonatomic) IBOutlet UIImageView *courseImageView;

@end

@implementation HNKeyCourseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCourse:(HNKeyCourse *)course
{
    _course = course;
    
    self.courseTitleLabel.text = _course.name;
    self.courseDescLabel.text = _course.org_name;
    [self.courseImageView setImageWithUrl:_course.thumbImageUrl];
}

@end
