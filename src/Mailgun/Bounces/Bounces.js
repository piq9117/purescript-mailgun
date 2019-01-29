var isNil = function(a) {
  return a === undefined || a === null;
};

exports.bouncesImpl = function(mailgun, addr) {
  return isNil(addr)
    ? mailgun.bounces()
    : mailgun.bounces(addr);
};

exports.listImpl = function(bounces, cb) {
  return bounces.list(cb);
};

exports.infoImpl = function(bounces, cb) {
  return bounces.info(cb);
};

exports.deleteImpl = function(bounces, cb) {
  return bounces.delete(cb);
};

exports.createImpl = function(bounces, attr, cb) {
  return bounces.create(attr, cb);
};
