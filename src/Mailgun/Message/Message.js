exports.sendMessageImpl = function(messages, msgData, cb) {
  return function () {
    return messages.send(msgData, cb);
  };
};

exports.messages = function (mailgun) {
  return function () {
    return mailgun.messages();
  };
};
