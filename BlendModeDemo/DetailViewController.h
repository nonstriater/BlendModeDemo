//
//  DetailViewController.h
//  BlendModeDemo
//
//  Created by null on 14-12-15.
//  Copyright (c) 2014年 nonstriater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

