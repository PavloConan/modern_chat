import createChannel from "client/cable";

let callback;

const chat = createChannel("ChatChannel", {
  received({ message }) {
    if (callback) callback.call(null, message);
  }
});

function sendMessage(message) {
  chat.perform("send_message", { message });
}

function setCallback(fn) {
  callback = fn;
}

export { sendMessage, setCallback };

/* We import our createChannel function from the cable.js module.
We are calling it with two arguments: the name of our channel
(note that what is some_channel in Ruby should be SomeChannel in JavaScript,
you have to respect this convention for things to work) and an object that
defines Action Cable standard callbacks: connected, disconnected or received.
We only need received that will be called once the consumer receives a channel broadcast
with the broadcasted data as an argument in the form of a JavaScript object
(Rails handles conversion between Ruby and JS objects all on itself).
Then things get a little tricky: once we receive a message object,
we need to invoke some function. We don’t want to define this function here,
as it will be the responsibility of our component that should know how to handle DOM
according to its needs. So we create a generic function setCallback that,
once invoked from a right component, will change the callback variable to store
whatever component-specific function we want to call once the message received.
sendMessage calls a perform method on our connection instance which is the
most magical part of Action Cable: invoking Ruby methods from JavaScript.
This will trigger send_message method from our chat_channel.rb and pass it a message object as an argument.
The { message } notation is an ES6 shorthand for { message: message },
as we expect our payload to be under the message key. A “message” in this context is just a text
that visitor types into the message form.
Finally, we export both sendMessage and setCallback from a module to be used from our components later.
*/
