# UILiveTiles
A UIView subclass for displaying an array of content in a Windows Live Tile like experience

# Demo
[![Click to view on YouTube](http://img.youtube.com/vi/PwamWy_GG50/0.jpg)](http://www.youtube.com/watch?v=PwamWy_GG50)

# Features

* Supports text and/or images
* Unlimited content
* Control how long it takes to advance to next item
* Memory optimized
* Lightweight, clean, easy-to-read, code that you will enjoy using in your projects.

## Requirements

* iOS 6.1 or later.
* ARC memory management.

## API Reference

```obj-c
UILiveTile *liveTileTextImages = [[UILiveTile alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2 - 300 / 2, self.view.bounds.size.height / 2 - 200 / 2, 300, 200)];
```
Initialize live tile with frame (must set frame on initialization)
 
```obj-c 
[self.view addSubview:liveTileTextImages];
```
Add live tile to view

```obj-c
liveTileTextImages.delegate = self;
```
Set the delegate of the live tile to the view its in

## Content
Content is a base array with a dictionary for each 'slide'. In there, there should be a dictionary. Live tiles watches for 3 keys. You dont need to place all 3 keys...only put the ones you actually use. The keys are (without quotes): "slideTitle", "slideContent", "slideImage". "slideTitle" and "slideContent" are NSString values. "slideImage" is an UIImage value. See code below for an example.

```obj-c
NSMutableArray *content = [[NSMutableArray alloc] init];
[content addObject:@{@"slideTitle": @"BlahBlah", @"slideContent": @"BlahBlah asdfa sdf asdf as dfa sdf asd fa sdf asd f asdf asd f asdf as df asd fas df as df asdf a sdf asd fas df as df asdf asd fa sdf as df asd f asdf sad fa sdf asdf asd fas df asdf as df asdf asd f sadf sad fasd f asdf asd f asdf sd f sdf asd fa sdf asdf as dfas df asdf sad fs adf sadf sad fs daf sadf asd f sdaf sad fasd fs adf sad fs adf sd fsa df asdf as df sadf sad fas df sadf sad fs adf asd fas df asdf asd f asdf asd f asdf as df asdf as df asd f asdf as df asd f asdf asdf sa dfas f asdf ads f asdf asdf das fsad f adsf adsf das fsad fs daf asdf a sdf asdf asf sda fasd fa sdf sad fasd fasd dfas"}];
[content addObject:@{@"slideTitle": @"BlahBlah1", @"slideContent": @"Muhahahahaha1"}];
[content addObject:@{@"slideTitle": @"BlahBlah2", @"slideContent": @"Muhahahahaha2", @"slideImage": @"image3.png"}];
liveTileTextImages.content = content;
```
Set the content of the live view (can be set any time. See updating UI of live tile below)

```obj-c
[liveTileTextImages reloadContent];
```
Updates the UI to match the current content property

## Animating
There are 2 ways to animate. One is a fixed duration where you set a duration (i.e 5 seconds) and it goes to the next 'slide' after 5 seconds. A second way is random duration where to give 2 parameters and it picks a random time interval between those 2 times and sets that as the time it takes to go to the next 'slide'.
```obj-c
[liveTileTextImages beginAnimatingLiveTileWithFixedDuration:5.0f];
```
Fixed duration example

```obj-c
[liveTileTextImages beginAnimatingLiveTileWithRandomDurationBetween:4.0f and:6.0f];
```
Random duration example
