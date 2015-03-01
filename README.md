## Description

ANProgressStepper is a simple control that shows numbered circles with different background colours to provide the user with feedback on their progress through a multi-step process. 

## Screenshots

All the colours are configurable and the control can be displayed with or without lines connecting the circles.

![Screenshot without connecting lines](Screenshot1.png)

![Screenshot with connecting lines](Screenshot2.png)

## Usage

This control has circles that depict "Incomplete Steps", which are steps in the process the user is yet to complete. They can be set to "Complete", which are steps the user as completed; and also "Active" which is the step the user is currently on. All you need to do is specify the current step on every page (I recommend you do this in `viewDidLoad`) and the control does the rest for you.

To use this control, create a view in your Storyboard or .xib file and set it's class as `ANProgressStepper`. You will need to create a class that conforms to the ANProgressStepperAttributes protocol to configure the view. Set the "attributes" property of the ANProgressStepper view to the class that conforms to this protocol (you can do this in interface builder).

For the complete set of configurable attributes and how to use them, refer to the docs for the protocol available on [CocoaDocs](http://cocoadocs.org/docsets/ANProgressStepper/).

The circles and text will size themselves based on the height and width of the view. I recommend you use even numbers for the height and text size(if you manually override it)

## Examples

An example project using the control can be found under the ANProgressStepperExampleApp directory. Run `pod install` before using this.

## Requirements

ANProgressStepper requires at least iOS 7 and ARC.

## Installation

ANProgressStepper is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "ANProgressStepper"

## Documentation

[Docs are available on CocoaDocs](http://cocoadocs.org/docsets/ANProgressStepper/)

## Author

Ayush Newatia, ayush.newatia@icloud.com

## License

ANRestOps is available under the MIT license. See the LICENSE file for more info.

