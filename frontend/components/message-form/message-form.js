import { sendMessage } from "client/chat";
import "./message-form.css";

const form = document.querySelector(".message-form");
const text = form.querySelector(".js-message-form--text");
const submit = form.querySelector(".js-message-form--submit");

function submitForm() {
  const chatroomId = $(".js-messages--content").data("chatroom-id");
  sendMessage(text.value, chatroomId);
  text.value = "";
  text.focus();
}

text.addEventListener("keydown", event => {
  if (event.keyCode === 13) {
    event.preventDefault();
    submitForm();
  }
});

submit.addEventListener("click", event => {
  event.preventDefault();
  submitForm();
});
