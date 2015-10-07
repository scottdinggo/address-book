//
//  MemberTableViewController.m
//  手机通讯录
//
//  Created by Scottding on 15/9/29.
//  Copyright (c) 2015年 NYNU. All rights reserved.
//

#import "MemberTableViewController.h"
#import "AddViewController.h"
#import "EditViewController.h"
#import "Contents.h"

@interface MemberTableViewController ()<UIActionSheetDelegate,AddViewControllerDelegate>
- (IBAction)Logout:(UIBarButtonItem *)sender;
@property (nonatomic, strong) NSMutableArray *content;

@end

@implementation MemberTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (NSMutableArray *)content {
    if(_content == nil)
        _content = [NSMutableArray array];
    return _content;
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.content.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if(cell ==nil){
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
//    }
     Contents *content = self.content[indexPath.row];
    cell.textLabel.text = content.name;
    cell.detailTextLabel.text = content.phone;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Logout:(UIBarButtonItem *)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"确定注销吗?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex  {
    if(buttonIndex == 0)    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)addViewController:(AddViewController *)addVc addContents:(Contents *)contents  {
    [self.content addObject:contents];
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender    {
    id vc = segue.destinationViewController;
    if([vc isKindOfClass:[AddViewController class]])    {
        AddViewController *VC = segue.destinationViewController;
        VC.delegate = self;
    }
    else if ([vc isKindOfClass:[EditViewController class]]) {
        EditViewController *editVc = vc;
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        editVc.content = self.content[path.row];
    }
}

@end
