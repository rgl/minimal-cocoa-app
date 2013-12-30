#import <Cocoa/Cocoa.h>

int main(void) {
    [NSAutoreleasePool new];

    [NSApplication sharedApplication];

    // NB In Snow Leopard (10.6), programs without an application bundle
    //    don't get a menubar and can't be brought to the front unless the
    //    activation policy is changed.
    // See https://developer.apple.com/library/mac/documentation/AppKit/Reference/NSRunningApplication_Class/Reference/Reference.html#//apple_ref/doc/c_ref/NSApplicationActivationPolicy
    [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];

    // NB this is needed to activate the application when we launch it from Terminal. 
    dispatch_async(dispatch_get_main_queue(), ^{
        [NSApp activateIgnoringOtherApps:YES];
    });

    id bundleInfo = [[NSBundle mainBundle] infoDictionary];
    id appName = [bundleInfo objectForKey:@"CFBundleName"];
    id appVersion = [bundleInfo objectForKey:@"CFBundleVersion"];

    id quitMenuItemTitle = [@"Quit " stringByAppendingString:appName];
    id quitMenuItem = [[NSMenuItem alloc] autorelease];
    [quitMenuItem
        initWithTitle:quitMenuItemTitle
        action:@selector(terminate:)
        keyEquivalent:@"q"];

    id appMenu = [[NSMenu new] autorelease];
    [appMenu addItem:quitMenuItem];

    // NB You don't need to give the first item in the menubar a name (it
    //    will get the application's name automatically).
    id appMenuItem = [[NSMenuItem new] autorelease];
    [appMenuItem setSubmenu:appMenu];

    id mainMenu = [[NSMenu new] autorelease];
    [mainMenu addItem:appMenuItem];

    [NSApp setMainMenu:mainMenu];

    id window = [[NSWindow alloc] autorelease];
    [window
        initWithContentRect:NSMakeRect(0, 0, 320, 240)
        styleMask:NSTitledWindowMask
        backing:NSBackingStoreBuffered
        defer:NO];
    [window setTitle:[[appName stringByAppendingString:@" v"] stringByAppendingString:appVersion]];
    [window center];
    [window makeKeyAndOrderFront:nil];

    // NB run never returns.
    [NSApp run];

    return 0;
}
