# Homework 2 - *CoderChat*

**CoderChat** is a Ruby on Rails blog application that allows users to send messages to each other that can only be read once.

Submitted by: **Chau Vo**

Time spent: 20 hours

URL: https://cheetah-chat.herokuapp.com/

## User Stories

The following **required** functionality is complete:

* [x] User can sign up by providing their email, password, and name.
* [x] User can login using an email and password.
* [x] After logging in, the user is taken to a page that has a list of incoming messages, sorted in descending chronological order (newest messages at top), a "new message" link, an "add friends" link, and a "sent messages" link.
* [ ] Unread messages should be **bold** or something similar in the list of messages.
* [x] Clicking the "add friends" link takes the user to a page with all users listed, with a link to "add user to friends list".
* [x] Clicking on "new message" takes the user to a page where they can write a new mesasge. The recipient field should be a dropdown, where the options are names from the user's friends.
* [ ] Clicking on "sent messages" takes the user to a page listing messages they have sent. Each message should display at what time it was read by the recipient, or "unread". The user cannot read the contents of the messages.
* [x] User can read a message's content only once. Once the message has been read, the user will see a page indicating the message has already been read.
* [x] User can only read messages where they are the recipient.

The following **optional** functionality is complete:

* [ ] User can attach an image.
* [ ] User can have multiple recipients on one message.
* [ ] User can log in with Facebook.
* [ ] Use of the [kaminari gem](https://github.com/amatsuda/kaminari) and [jquery-infinite-pages gem](https://github.com/magoosh/jquery-infinite-pages) to implement Infinite Scroll.
* [ ] User gets an email when they receive a message, with a link to view the message.
* [ ] User gets an email when a message they have sent is read with the time at which the message was read.
* [ ] User can send a message to the email address of a non-registered user. The recipient will receive an email with a link to sign up for the service, and after creating an account, will be able to view the sent message.
* [x] User A can "block" User B. If User A blocks User B, they will not see messages from User B. User B will not know they have been blocked.
* [x] User can remove friends from their friends list.
* [x] User can unblock friends from their block list.


**Note:** In CoderChat, user can only read sent messages in case the recipient haven't read those messages. So I didn't implement the rest of required features.