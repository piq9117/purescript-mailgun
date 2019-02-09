var isNil = function(a) {
  return a === undefined || a === null;
};

exports.membersImpl = function (mailingList, memberAddress) {
  return isNil(memberAddress)
    ? mailingList.members()
    : mailingList.members(memberAddress);
};

exports.listImpl = function(members, cb) {
  return members.list(cb);
};

exports.pageImpl = function(members, cb) {
  return members.pages().page(cb);
};

exports.infoImpl = function(members, cb) {
  return members.info(cb);
};

exports.createImpl = function(members, attr, cb) {
  return members.create(attr, cb);
};

exports.addImpl = function(members, attr, cb) {
  return members.add(attr, cb);
};

exports.updateImpl = function(members, attr, cb) {
  return members.update(attr, cb);
};

exports.deleteImpl = function(members, cb) {
  return members.delete(cb);
};
