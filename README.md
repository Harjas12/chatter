# Lab 4 - *Chatter*

**Chatter** is a Chat app using an [open source Parse](http://parseplatform.org/) backend.

Time spent: **6** hours spent in total

## User Stories

The following **required** user stories are complete:

- [x] User can sign up and sign in to the login screen (+1pt)
- [x]  User sees alerts for login exceptions, i.e. "account already exists", "wrong credentials", etc. (+1pt)
- [x] User can compose and send chat messages (+2pt)
- [x] User can view a list of chat messages in chronological order (+2pt)
- [x] Automatically Adjust Cell Size to Fit Text (+1pt)
- [x] Username of chat author is displayed in each chat message (+2pt)
- [x] Persist Logged in User (+1pt)

The following **stretch** user stories are implemented:

- [ ] User sees an activity indicator while waiting for authentication (+1pt)
- [ ] User can pull to refresh Chat feed (+1pt)
- [ ] Add an "Adorable Avatar" for each user by requesting an avatar from the [Adorable Avatars API](https://github.com/adorableio/avatars-api) (+2pt)
- [x] Chat Bubble Style Design (+3pt)
- [ ] Expand or contract the cell layout as needed to show the chat message author (user) if it exists (+2pt)

The following **additional** user stories are implemented:

- [x] Inverted layout to display messages so that the newest are at the bottom
- [x] Moves view up when keyboard is in use
- [x] Puts messages from the current user to the right side, and messages from everyone else to the left side
- [x] Added auto layout to make phone screen rotate properly

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How to have a single view controller control multiple views
2. How to programmatically build views, instead of using the storyboard

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='walkthrough.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

The biggest challenge was integrating the coocpods correctly. Xcode was not recongizing Parse and other pods. To fix this issue I used an objective-c bridging header file.

## License

    Copyright [2018] [Harjas Monga]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
