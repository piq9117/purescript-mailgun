var isNil = function(a) {
  return a === undefined || a === null;
};

exports.mailingListImpl = function(mailgun, address) {
  return isNil(address)
    ? mailgun.lists()
    : mailgun.lists(address);
};

exports.listImpl = function(mailingList, cb) {
  return mailingList.list(cb);
};

exports.infoImpl = function(mailingList, cb) {
  return mailingList.info(cb);
};

exports.createImpl = function(mailingList, attr, cb) {
  return mailingList.create(attr, cb);
};

exports.updateImpl = function(mailingList, attr, cb) {
  return mailingList.update(attr, cb);
};

exports.deleteImpl = function(mailingList, cb) {
  return mailingList.delete(cb);
};
