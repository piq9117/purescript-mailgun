exports.sendMessageImpl = function (messages) {
  return function (msgData) {
    return function (cb) {
      return messages.send(msgData, cb);
    };
  };
};

exports.messages = function (mailgun) {
  return mailgun.messages();
};
