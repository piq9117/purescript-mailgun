var isNil = function(a) {
  return a === undefined || a === null;
};

exports.complaintsImpl = function(mailgun, address) {
  return isNil(address)
    ? mailgun.complaints()
    : mailgun.complaints(address);
};

exports.listImpl = function(complaints, cb) {
  return complaints.list(cb);
};

exports.createImpl = function(complaints, attr, cb) {
  return complaints.create(attr, cb);
};

exports.infoImpl = function(complaints, cb) {
  return complaints.info(cb);
};

exports.deleteImpl = function(complaints, cb) {
  return complaints.delete(cb);
};
