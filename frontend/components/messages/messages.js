import { setCallback } from "client/chat";
import "components/message/message";
import "./messages.css";

const messages = document.querySelector(".js-messages");
const content = messages.querySelector(".js-messages--content");

function scrollToBottom() {
  content.scrollTop = content.scrollHeight;
}

scrollToBottom();

setCallback(data => {
  messages
    .querySelector(`[data-chatroom-id='${data.chatroomId}']`)
    .insertAdjacentHTML("beforeend", data.message);
  scrollToBottom();
});
