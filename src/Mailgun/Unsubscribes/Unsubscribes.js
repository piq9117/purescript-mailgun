var isNil = function(a) {
  return a === undefined || a === null;
};

exports.unsubscribesImpl = function(mailgun, address) {
  return isNil(address)
    ? mailgun.unsubscribes()
    : mailgun.unsubscribes(address);
};
