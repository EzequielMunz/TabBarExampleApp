//
//  FirstViewController.m
//  TabBarExampleApp
//
//  Created by Ezequiel on 12/19/14.
//  Copyright (c) 2014 Ezequiel. All rights reserved.
//

#import "FirstViewController.h"
#import "CreditsViewController.h"
#import "MessageFirstViewController.h"
#import "MessageSecondViewController.h"

NSString* const CELL_ID = @"Cell";

typedef enum
{
    MESSAGES = 0,
    CREDITS,
    FIESTA
    
} CellIdentifier;

@interface FirstViewController ()

@property (strong, nonatomic) IBOutlet UITableView *myTable;
@property (nonatomic, strong) NSArray* data;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.data = @[@"Messages" ,@"Credits"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID];
    }
    cell.textLabel.text = (NSString*)self.data[indexPath.row];
    NSLog(@"%ld", (long)indexPath.row);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellIdentifier id_ = (CellIdentifier)indexPath.row;
    
    UIStoryboard *story;
    UIViewController *view;
    switch (id_)
    {
        case MESSAGES:
            story = [UIStoryboard storyboardWithName:@"Messages" bundle:[NSBundle mainBundle]];
            view = (MessageFirstViewController*)[story instantiateViewControllerWithIdentifier:@"part1"];
            [self.navigationController pushViewController:view animated:YES];
            break;
        case CREDITS:
            story = [UIStoryboard storyboardWithName:@"Messages" bundle:[NSBundle mainBundle]];
            view = (MessageSecondViewController*)[story instantiateViewControllerWithIdentifier:@"part2"];
            [self.navigationController pushViewController:view animated:YES];
            break;
        case FIESTA:
            break;
        default:
            break;
    }
}

@end
