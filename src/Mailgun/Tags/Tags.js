var isNil = function(a) {
  return a === undefined || a === null;
};

exports.tagsImpl = function(mailgun, tag) {
  return isNil(tag)
    ? mailgun.tags()
    : mailgun.tags(tag);
};

exports.infoImpl = function(tags, cb) {
  return tags.info(cb);
};

exports.aggregatesImpl = function(stats) {
  return stats.aggregates();
};

exports.countriesImpl = function(aggregates) {
  return aggregates.countries();
};

exports.countriesListImpl = function(countries, cb) {
  return countries.list(cb);
};

exports.providersImpl = function(aggregates) {
  return aggregates.providers();
};

exports.providersListImpl = function(providers, cb) {
  return providers.list(cb);
};

exports.devicesImpl = function(aggregates) {
  return aggregates.devices();
};

exports.devicesListImpl = function(devices, cb) {
  return devices.list(cb);
};

exports.deleteImpl = function(tags, cb) {
  return tags.delete(cb);
};

exports.listImpl = function(tags, cb) {
  return tags.list(cb);
};

exports.tagStatsImpl = function(tags) {
  return tags.stats();
};

exports.tagStatsInfoImpl = function(tagStats, cb) {
  return tagStats.info(cb);
};
