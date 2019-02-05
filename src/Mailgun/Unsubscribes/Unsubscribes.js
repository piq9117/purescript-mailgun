var isNil = function(a) {
  return a === undefined || a === null;
};

exports.unsubscribesImpl = function(mailgun, address) {
  return isNil(address)
    ? mailgun.unsubscribes()
    : mailgun.unsubscribes(address);
};

exports.listImpl = function(unsubs, cb) {
  return unsubs.list(cb);
};

exports.infoImpl = function(unsubs, cb) {
  return unsubs.info(cb);
};

exports.deleteImpl = function(unsubs, cb) {
  return unsubs.delete(cb);
};

exports.createImpl = function(unsubs, attr, cb) {
  return unsubs.create(attr, cb);
};
