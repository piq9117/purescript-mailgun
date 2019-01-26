exports.trackingImpl = function(domain) {
  return domain.tracking();
};

exports.infoImpl = function(tracking, cb) {
  return tracking.info(cb);
};

exports.openTrackingImpl = function(tracking) {
  return tracking.open();
};

exports.updateOpenTrackingImpl = function(openTracking, attr, cb) {
  return openTracking.update(attr, cb);
};

exports.clickTrackingImpl = function(tracking) {
  return tracking.click();
};

exports.updateClickTrackingImpl = function(clickTracking, attr, cb) {
  return clickTracking.update(attr, cb);
};

exports.unsubTrackingImpl = function(tracking) {
  return tracking.unsubscribe();
};

exports.updateUnsubTrackingImpl = function(unsubTracking, attr, cb) {
  return unsubTracking.update(attr, cb);
};
