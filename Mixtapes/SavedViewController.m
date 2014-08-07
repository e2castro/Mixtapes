//
//  SavedViewController.m
//  Mixtapes
//
//  Created by Edgardo Castro on 7/25/14.
//  Copyright (c) 2014 Chotsbots. All rights reserved.
//

#import "SavedViewController.h"

@interface SavedViewController ()

@end

@implementation SavedViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    MPMediaQuery *everything = [[MPMediaQuery alloc]init];
    
    NSLog(@"Logging items from a generic query...");
    
    NSArray *itemsFromGenericQuery = [everything items];
    
    self.songTitles = [[NSMutableArray alloc]init];
    
    self.playBackQueue = [[NSMutableArray alloc]init];
    
    for (MPMediaItem *song in itemsFromGenericQuery) {
        NSString *songTitle = [song valueForProperty: MPMediaItemPropertyTitle];
        [self.songTitles addObject:songTitle];
        [self.playBackQueue addObject:song];
    }

    MPMediaItemCollection *m = [[MPMediaItemCollection alloc] initWithItems:(NSArray*)self.playBackQueue];
    
    self.songs = m;

    self.myPlayer = [MPMusicPlayerController applicationMusicPlayer];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.songTitles count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"temp" forIndexPath:indexPath];
    cell.textLabel.text = [self.songTitles objectAtIndex:indexPath.row];
    // Configure the cell...
    
    //Create the button and add it to the cell
	
    
    return cell;
}

- (IBAction)playSong:(id)sender {
    
    
    [self.myPlayer pause];
    
    UIView *view = sender;
    
    while (![view isKindOfClass:[UITableViewCell class]]) {
        view = [view superview];
    }
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)view];
    
    MPMediaItem *targetSong = [self.playBackQueue objectAtIndex:indexPath.row];
    NSArray *song = [NSArray arrayWithObject:targetSong];
    MPMediaItemCollection * collection = [MPMediaItemCollection collectionWithItems:song];
    
    [self.myPlayer setQueueWithItemCollection:collection];
    
    
    if(self.myPlayer.nowPlayingItem == nil){
        
        self.myPlayer.nowPlayingItem = [[self.songs items] objectAtIndex:indexPath.row];
        NSLog(@"Entered nil check");
        
    }

    [self.myPlayer play];
    
    /*
    NSNumber *nowPlaying = [[NSNumber alloc] initWithUnsignedInteger:self.myPlayer.indexOfNowPlayingItem];
    
    NSLog(@"Checkpoint 2");

    
    NSNumber *index = [[NSNumber alloc] initWithInteger:indexPath.row];
    
    
    int x = [nowPlaying intValue];
    int y = [index intValue];
    int z = x-y;
    int abs = ABS(z);
    
    NSLog(@"x:%d",x);
    NSLog(@"y:%d",y);
    NSLog(@"z:%d",z);
    NSLog(@"abs:%d",abs);
    
    NSLog(@"Index of now playing item: %d",self.myPlayer.indexOfNowPlayingItem);
    

    
    for (int i = 0; i< abs; i++) {
        if (x < y) {
            [self.myPlayer skipToPreviousItem];
            NSLog(@"%d",i);
        }
        else{
            [self.myPlayer skipToNextItem];
            NSLog(@"%d",i);


        }
    }
    [self.myPlayer play];
    */
    
}

    /*
    UITableViewCell *owningCell = (UITableViewCell*)[sender superview];
    NSIndexPath *pathToCell = [self.tableView indexPathForCell:owningCell];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Custom Button Pressed"
														message:[NSString stringWithFormat: @"You pressed the custom button on cell #%i", pathToCell.row + 1]
													   delegate:self cancelButtonTitle:@"Great"
											  otherButtonTitles:nil];
	[alertView show];
     */

    
    
    //int index = pathToCell.row -


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
