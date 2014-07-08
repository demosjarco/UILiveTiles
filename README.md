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
