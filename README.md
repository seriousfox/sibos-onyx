# Bourbon Neat Base Site Template

## Getting Started
1.    $ cd into_directory
2.    $ bundle
3.    $ guard init livereload && guard
4.    $ foreman start
5.    Open chrome on 0.0.0.0:5000
6.  Activate LiveReload (if not installed, add extension https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei/related for live reload)

7. Search and replace all instances of [site-name] with the name of the project.


## Custom mixins with explanations

**col($col-no, $shift-no, $media, $drop-to, $shift-to)**

Autodropping collumns to specified setup


**simple-col($col-no, $shift-no)**

Quicker way of defining span-collumns and shifts.
Especially useful for mediaquery changes where layout changes accross more than 1 breakpoint

**single-col**

Quick dropping collumns to 12,0 esp useful for mobile layouts where tablet layout has shifts or smaller collumn width

**font($family, $size, $color)**

Quick define fonts


## Variable Style Guide

If font weight is determined by font family (if possible avoid) then define as *serif*, *serif-bold* et cetera.