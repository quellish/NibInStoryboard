There are two projects here that demonstrate how to use nibs/xibs for custom views within storyboards:

StoryboardLoadingNib

Demonstrates a custom view backed by a nib used in a storyboard. When the storyboard instantiates the custom view it does so through `initWithCoder:` using the storyboard decoder. The storyboard decoder will not look for an external nib file for our custom view, so in `initWithCoder:` we do that ourselves.

StoryboardLoadingDesignableNib

Demonstrates the above but also implements Interface Builder preview and customization. IB_DESIGNABLE requires `initWithFrame:` to be implemented, here we call our private nib loading method. This gives Interface Builder everything it needs to create a preview from our views.