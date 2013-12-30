This repository contains the minimal code needed to create a Cocoa Application from scratch; no Xcode used.

The code was based on the [Minimalist Cocoa programming] [0] blog post.  With some slight modifications, like the addition of a [Application Bundle] [1].

To compile and run it, execute the following command on a Terminal:

    make


# Why we need an Application Bundle?

If you try to directly execute the application binary with Finder, you'll see it opened inside a Terminal window... which is quite sad... so that's why!

**NB** An Application Bundle is just directory with a `.app` suffix.

**NB** I'm not sure if there is a way to skip the Application Bundle... if you find out, let me known!


[0]:http://www.cocoawithlove.com/2010/09/minimalist-cocoa-programming.html
[1]:https://developer.apple.com/library/mac/documentation/CoreFoundation/Conceptual/undles/BundleTypes/BundleTypes.html
