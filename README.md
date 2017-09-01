# Animation Examples

Here are a few animations I put together to help another iOS developer with a project he was having trouble with.

### Sticky Table Header Image
##### problem
As the table view scrolls up the image will temporarily remain in place.  After the scroll reaches a specific threshold, the image will begin to move off the screen.

##### solution
By using the [scrollViewDidScroll:](https://developer.apple.com/documentation/uikit/uiscrollviewdelegate/1619392-scrollviewdidscroll?language=objc) method in the [UIScrollViewDelegate](https://developer.apple.com/documentation/uikit/uiscrollviewdelegate?language=objc), I calculated the offset distance and adjust the transform property of the image view as needed.

### Scale With A Bounce
##### problem
When the main view first appears a green square scales up from 0 to 100 percent with a small bounce at the end.

##### solution
This animation is a achieved by setting the view layers transform property to scale down the view to 0% in the [viewDidLoad](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621495-viewdidload?language=objc) method and scaling it back up to 100% in the [viewDidAppear:](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621423-viewdidappear?language=objc) method. I was able to make the animation bounce slightly by using the view animation method [animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](https://developer.apple.com/documentation/uikit/uiview/1622594-animatewithduration?language=objc) and setting the spring damping and initial spring velocity.

### Blinking Eyes
##### problem
After the image appears, the green square has eyes that blink every few seconds.  This animation should repeat as long as the app is open.

##### solution
Okay, I cheated a little bit on this one.  I used a program to called [PaintCode](https://www.paintcodeapp.com) to generate the two paths that the [CAShapeLayer](https://developer.apple.com/documentation/quartzcore/cashapelayer?language=objc) needs to make the eyes blink.  There's a path for closed eyes which looks like two thin ellipses, and there's an open eyes path which looks like two full circles.

The animation is simply a [CABasicAnimation](https://developer.apple.com/documentation/quartzcore/cabasicanimation?language=objc) that switches the layers path from the open eyes path to the closed eyes path. Setting the autoreverse property to true makes the path switch back again.  I was able to make the blink continuously occur every few seconds by putting that animation inside a [CAAnimationGroup](https://developer.apple.com/documentation/quartzcore/caanimationgroup?language=objc) with a duration of 3 seconds and a repeat count of infinity.
