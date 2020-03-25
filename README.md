# mNeme

You can find the deployed project at [Testflight](https://testflight.apple.com/join/VzoS17cY).

## Contributors


|                                       [Student 1](https://github.com/)                                        |                                       [Student 2](https://github.com/)                                        |                                       [Student 3](https://github.com/)                                        |
| :-----------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------: |
|                      [<img src="https://i.ibb.co/6mN3Qm3/IMG-20190124-WA0000.jpg" width = "200" />](https://github.com/)                       |                      [<img src="https://i.ibb.co/wWHbhfV/nar.jpg" width = "200" />](https://github.com/)                       |                      [<img src="https://i.ibb.co/XLdx0pS/image-11-33-55-AM.png" width = "200" />](https://github.com/)                       |
|                 [<img src="https://github.com/favicon.ico" width="15"> ](https://github.com/drudolpho)                 |            [<img src="https://github.com/favicon.ico" width="15"> ](https://github.com/narmkumar)             |           [<img src="https://github.com/favicon.ico" width="15"> ](https://github.com/skysuzuki)            |
| [ <img src="https://static.licdn.com/sc/h/al2o9zrvru7aqj8e1x2rzsrca" width="15"> ](https://www.linkedin.com/in/dennis-rudolph-279797169/) | [ <img src="https://static.licdn.com/sc/h/al2o9zrvru7aqj8e1x2rzsrca" width="15"> ](https://www.linkedin.com/in/narkumar/) | [ <img src="https://static.licdn.com/sc/h/al2o9zrvru7aqj8e1x2rzsrca" width="15"> ](https://www.linkedin.com/in/skyler-suzuki-a2352188/) |


[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)  
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)


## Project Overview

You can find the deployed project at [Testflight](https://testflight.apple.com/join/VzoS17cY).

[mNeme iOS Trello Board](https://trello.com/b/AZ7wMHHm/mneme-ios)

[Product Canvas](https://www.notion.so/iOS-Release-v1-0-Labs-21-Profile-Preferences-and-Demo-Deck-cb46e5e40d9d4638bfda5ad0542e047c)

[Figma](https://www.figma.com/file/Wp3OFlKGGV1jiLSaLWO5tN/mNeme?node-id=197%3A0)


The general overview of the iOS nMeme app is to allow users to create, study and share flashcards.

For the current version 1.0 of the iOS app, nMeme is focused on creating a solid foundation for a streamlined user experience. Users need an easy, intuitive and accessible way to create an account and access their home dashboard. Users need to be able to set up preferences about study subjects and preferred study methods to get the most out of their study experience.

<img src="https://i.ibb.co/Z2JD9bX/Screen-Shot-2020-03-01-at-3-34-51-PM.png" width = "200" /> <img src="https://i.ibb.co/tJNxWH2/Screen-Shot-2020-03-01-at-3-36-06-PM.png" width = "200" /><img src="https://i.ibb.co/Khrvgq7/Screen-Shot-2020-03-01-at-3-37-35-PM.png" width = "200" />

### Features

-    Responsive sign-up/ login authentication process using Firebase with login of their choice (FB, Google, Email)
-    Demo deck that can be viewed and flipped through to understand the flow of studying
-    Home dashboard framework implemented, where future metrics will be housed
-    User preferences can be set up and saved, pushing information up to our database for data collection 

### Authentication API here

Firebase Auth

### Cocoapods

- Firebase
- Firebase/Auth
- Firebase/Analytics
- SOTabBar
- GoogleSignIn
- FacebookLogin
- FacebookCore

## Requirements

-   iOS 8.0+
-   Xcode 7.3
-   Cocoa Pods

## Contributing

When contributing to this repository, please first discuss the change you wish to make via issue, email, or any other method with the owners of this repository before making a change.

Please note we have a [code of conduct](./CODE_OF_CONDUCT.md). Please follow it in all your interactions with the project.

### Issue/Bug Request

    ## Contributing

When contributing to this repository, please first discuss the change you wish to make via issue, email, or any other method with the owners of this repository before making a change.

Please note we have a [code of conduct](./code_of_conduct.md). Please follow it in all your interactions with the project.

### Issue/Bug Request

 **If you are having an issue with the existing project code, please submit a bug report under the following guidelines:**
 - Check first to see if your issue has already been reported.
 - Check to see if the issue has recently been fixed by attempting to reproduce the issue using the latest master branch in the repository.
 - Create a live example of the problem.
 - Submit a detailed bug report including your environment & browser, steps to reproduce the issue, actual and expected outcomes,  where you believe the issue is originating from, and any potential solutions you have considered.

### Feature Requests

We would love to hear from you about new features which would improve this app and further the aims of our project. Please provide as much detail and information as possible to show us why you think your new feature should be implemented.

### Pull Requests

If you have developed a patch, bug fix, or new feature that would improve this app, please submit a pull request. It is best to communicate your ideas with the developers first before investing a great deal of time into a pull request to ensure that it will mesh smoothly with the project.

Remember that this project is licensed under the MIT license, and by submitting a pull request, you agree that your work will be, too.

#### Pull Request Guidelines

- Ensure any install or build dependencies are removed before the end of the layer when doing a build.
- Update the README.md with details of changes to the interface, including new plist variables, exposed ports, useful file locations and container parameters.
- Ensure that your code conforms to our existing code conventions and test coverage.
- Include the relevant issue number, if applicable.
- You may merge the Pull Request in once you have the sign-off of two other developers, or if you do not have permission to do that, you may request the second reviewer to merge it for you.

### Attribution

These contribution guidelines have been adapted from [this good-Contributing.md-template](https://gist.github.com/PurpleBooth/b24679402957c63ec426).


## Documentation

See [Backend Documentation](https://github.com/Lambda-School-Labs/flashcards-be) for details on the backend of our project.


[swift-image]: https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
