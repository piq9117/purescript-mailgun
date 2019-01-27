exports.statsImpl = function(mailgun) {
  return mailgun.stats();
};

exports.listImpl = function(stats, cb) {
  return stats.list(cb);
};
