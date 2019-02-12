var isNil = function(a) {
  return a === undefined || a === null;
};

exports.tagsImpl = function(mailgun, tag) {
  return isNil(tag)
    ? mailgun.tags()
    : mailgun.tags(tag);
};

exports.listImpl = function(tags, cb) {
  return tags.list(cb);
};
