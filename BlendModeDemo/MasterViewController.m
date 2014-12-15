//
//  MasterViewController.m
//  BlendModeDemo
//
//  Created by null on 14-12-15.
//  Copyright (c) 2014年 nonstriater. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "LLTableViewCell.h"
#import "UIImage+Tint.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    self.objects = [NSMutableArray arrayWithArray:@[@"kCGBlendModeNormal",@"kCGBlendModeMultiply",@"kCGBlendModeScreen",@"kCGBlendModeOverlay",@"kCGBlendModeDarken",@"kCGBlendModeLighten",@"kCGBlendModeColorDodge",@"kCGBlendModeColorBurn",@"kCGBlendModeSoftLight",@"kCGBlendModeHardLight",@"kCGBlendModeDifference",@"kCGBlendModeExclusion",@"kCGBlendModeHue",@"kCGBlendModeSaturation",@"kCGBlendModeColor",@"kCGBlendModeLuminosity",@"kCGBlendModeClear",@"kCGBlendModeCopy",@"kCGBlendModeSourceIn",@"kCGBlendModeSourceOut",@"kCGBlendModeSourceAtop",@"kCGBlendModeDestinationOver",@"kCGBlendModeDestinationIn",@"kCGBlendModeDestinationOut",@"kCGBlendModeDestinationAtop",@"kCGBlendModeXOR",@"kCGBlendModePlusDarker",@"kCGBlendModePlusLighter"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LLTableViewCell *cell = (LLTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *text = self.objects[indexPath.row];
    cell.blendTextLabel.text = text;
    cell.blendImageView.image = [[UIImage imageNamed:@"pic.jpg"] imageWithTintColor:[UIColor orangeColor] blendMode:indexPath.row];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
