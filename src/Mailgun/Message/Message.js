exports.sendMessageImpl = function(messages, msgData, cb) {
  return messages.send(msgData, cb);
};

exports.messages = function (mailgun) {
  return mailgun.messages();
};
