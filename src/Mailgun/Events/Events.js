exports.eventsImpl = function(mailgun) {
  return mailgun.events();
};

exports.getImpl = function(events, cb) {
  return events.get(cb);
};
