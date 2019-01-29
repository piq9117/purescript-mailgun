exports.bouncesImpl = function(mailgun) {
  return mailgun.bounces();
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
