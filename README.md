# TableAnimationExamples

Here are a few animations I put together to help another iOS developer with a project he was having trouble with.

## Sticky Table Header Image
As the table view scrolls up the image will temporarily remain in place. After the scroll offset reaches a specific threshold, the image will begin to move off the screen.

By using the <a href="https://developer.apple.com/documentation/uikit/uiscrollviewdelegate/1619392-scrollviewdidscroll?language=objc">scrollViewDidScroll:</a> method in the <a href="https://developer.apple.com/documentation/uikit/uiscrollviewdelegate?language=objc">UIScrollViewDelegate</a>, you can calculate the offset distance and adjust the transform property of the image view as needed.

## Scale With A Spring
When the main view first appears a green square scales up from 0 to 100 percent with a small bounce at the end.

This animation is a achieved by setting the layer transform property to scale down the view to 0% in the viewDidLoad method and scaling it back up to 100% in the viewDidAppear: method. I was able to make the animation bounce slightly by using the view animation method <a href="https://developer.apple.com/documentation/uikit/uiview/1622594-animatewithduration?language=objc">animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:</a> and setting the spring damping and initial spring velocity.
