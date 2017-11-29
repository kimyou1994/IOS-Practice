//
//  TableTableViewController.m
//  Flashcard
//
//  Created by Young Kim on 11/5/17.
//  Copyright © 2017 Young Jin Kim. All rights reserved.
//

#import "TableTableViewController.h"
#import "FlashcardsModel.h"
#import "AddViewController.h"
#import "ViewController.h"

@interface TableTableViewController ()

@property (strong, nonatomic)FlashcardsModel *model;

@end

@implementation TableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = [FlashcardsModel sharedModel];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.leftBarButtonItem = self.editButtonItem;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return [self.model numberOfFlashcards];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableRow" forIndexPath:indexPath];
    NSString *question = [self.model flashcardAtIndex: indexPath.row].question; // getting question NSString
    NSString *answer = [self.model flashcardAtIndex: indexPath.row].answer; // getting answer NSString
    cell.textLabel.text = question;
    cell.detailTextLabel.text = answer;
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.model removeFlashcardAtIndex:indexPath.row];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    AddViewController *avc = segue.destinationViewController;
    avc.flashcardCompletionHandler = ^(NSString *question, NSString *answer) {
        [self.model insertWithQuestion:question answer:answer favorite:false];
        [self.tableView reloadData];
        [self dismissViewControllerAnimated:YES completion:^{
        }];
        
    };
}


@end
