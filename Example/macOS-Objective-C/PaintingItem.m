//
//  PaintingItem.m
//  macOS-Objective-C
//
//  Created by Felix Herrmann on 23.10.21.
//

#import "PaintingItem.h"
@import UIImageColorsObjc;


@interface PaintingItem ()

@property NSView *_imageView;

@end


@implementation PaintingItem


#pragma mark - Setter

- (void)setImage:(NSImage *)image {
    self._imageView.layer.contents = image;
    [image getColorsWithQuality:UIImageColorsScaleQualityHigh completion:^(NSImageColors * _Nullable colors) {
        if(colors != nil) {
            self.view.layer.backgroundColor = colors.background.CGColor;
            self.mainLabel.textColor = colors.primary;
            self.secondaryLabel.textColor = colors.secondary;
            self.detailLabel.textColor = colors.detail;
        } else {
            self.view.layer.backgroundColor = nil;
            self.mainLabel.textColor = NSColor.labelColor;
            self.secondaryLabel.textColor = NSColor.labelColor;
            self.detailLabel.textColor = NSColor.labelColor;
        }
    }];
}


#pragma mark - ViewController

- (void)loadView {
    self.view = [[NSView alloc] init];
    self.view.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    self.view.wantsLayer = YES;
    
    self._imageView = [[NSView alloc] init];
    self._imageView.layer = [[CALayer alloc] init];
    self._imageView.layer.contentsGravity = kCAGravityResizeAspectFill;
    self._imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.mainLabel = [[NSLabel alloc] init];
    self.mainLabel.font = [NSFont systemFontOfSize:15 weight:NSFontWeightSemibold];
    self.mainLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.secondaryLabel = [[NSLabel alloc] init];
    self.secondaryLabel.font = [NSFont systemFontOfSize:12 weight:NSFontWeightSemibold];
    self.secondaryLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.detailLabel = [[NSLabel alloc] init];
    self.detailLabel.font = [NSFont systemFontOfSize:12 weight:NSFontWeightSemibold];
    self.detailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutGuide *layoutGuide = [[NSLayoutGuide alloc] init];
    [self.view addLayoutGuide:layoutGuide];
    
    [self.view addSubview:self._imageView];
    [self.view addSubview:self.mainLabel];
    [self.view addSubview:self.secondaryLabel];
    [self.view addSubview:self.detailLabel];
    
    [NSLayoutConstraint activateConstraints:@[
        [layoutGuide.leadingAnchor constraintEqualToAnchor:self._imageView.trailingAnchor constant:20],
        [layoutGuide.trailingAnchor constraintLessThanOrEqualToAnchor:self.view.trailingAnchor constant:-20],
        [layoutGuide.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        
        [self._imageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self._imageView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self._imageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [self._imageView.widthAnchor constraintEqualToAnchor:self._imageView.heightAnchor],
        
        [self.mainLabel.leadingAnchor constraintEqualToAnchor:layoutGuide.leadingAnchor],
        [self.mainLabel.topAnchor constraintEqualToAnchor:layoutGuide.topAnchor],
        [self.mainLabel.trailingAnchor constraintLessThanOrEqualToAnchor:layoutGuide.trailingAnchor],
        
        [self.secondaryLabel.leadingAnchor constraintEqualToAnchor: layoutGuide.leadingAnchor],
        [self.secondaryLabel.topAnchor constraintEqualToAnchor: self.mainLabel.bottomAnchor constant:4],
        [self.secondaryLabel.bottomAnchor constraintEqualToAnchor: layoutGuide.bottomAnchor],
        
        [self.detailLabel.leadingAnchor constraintEqualToAnchor: self.secondaryLabel.trailingAnchor constant: 4],
        [self.detailLabel.firstBaselineAnchor constraintEqualToAnchor: self.secondaryLabel.firstBaselineAnchor],
        [self.detailLabel.trailingAnchor constraintLessThanOrEqualToAnchor: layoutGuide.trailingAnchor]
    ]];
}

@end
