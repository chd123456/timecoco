//
//  TCHomepageHeader.m
//  timecoco
//
//  Created by Xie Hong on 3/16/15.
//  Copyright (c) 2015 timecoco. All rights reserved.
//

#import "TCHomepageHeader.h"
#import "TCDashLineView.h"

@interface TCHomepageHeader ()

@property (nonatomic, strong) TCDashLineView *verticalDashLine;
@property (nonatomic, strong) TCDashLineView *horizontalDashLine;

@end

@implementation TCHomepageHeader

@synthesize headerType = _headerType;

- (void)awakeFromNib {
    [self verticalDashLine];
    [self horizontalDashLine];
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _verticalDashLine.lineColor = [TCColorManager changeColorForType:self.headerType];
    _horizontalDashLine.lineColor = _verticalDashLine.lineColor;
}

- (void)setHeaderType:(TCHomepageHeaderType)headerType {
    _headerType = headerType;

    [self setNeedsLayout];
}

- (TCHomepageHeaderType)headerType {
    if (_headerType == 0) {
        self.headerType = TCHomepageHeaderTypeDefault;
    }
    return _headerType;
}

- (TCDashLineView *)verticalDashLine {
    if (_verticalDashLine == nil) {
        self.verticalDashLine = [[TCDashLineView alloc] initWithFrame:CGRectMake(24, 0, 2, 30)];
        _verticalDashLine.startPoint = CGPointMake(0, 0);
        _verticalDashLine.endPoint = CGPointMake(0, 30);

        [self.contentView addSubview:_verticalDashLine];
    }
    return _verticalDashLine;
}

- (TCDashLineView *)horizontalDashLine {
    if (_horizontalDashLine == nil) {
        NSUInteger lineWidth = (SCREEN_WIDTH / 2 + 10) / 10;
        lineWidth = 10 * lineWidth + 4;
        self.horizontalDashLine = [[TCDashLineView alloc] initWithFrame:CGRectMake(0, 0, lineWidth, 2)];
        _horizontalDashLine.startPoint = CGPointMake(4, 0);
        _horizontalDashLine.endPoint = CGPointMake(lineWidth, 0);

        [self.contentView addSubview:_horizontalDashLine];
    }
    return _horizontalDashLine;
}

@end
