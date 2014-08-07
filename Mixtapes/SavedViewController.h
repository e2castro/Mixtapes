//
//  SavedViewController.h
//  Mixtapes
//
//  Created by Edgardo Castro on 7/25/14.
//  Copyright (c) 2014 Chotsbots. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface SavedViewController : UITableViewController
@property NSMutableArray *songTitles;
@property NSMutableArray *playBackQueue;
@property MPMediaItemCollection *songs;
@property MPMusicPlayerController *myPlayer;
@end
