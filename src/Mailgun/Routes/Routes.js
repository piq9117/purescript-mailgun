var isNil = require("../Common/js-utils").isNil;

exports.routesImpl = function(mailgun, id) {
  return isNil(a)
    ? mailgun.routes()
    : mailgun.routes(id);
};

exports.listImpl = function(routes, cb) {
  return routes.list(cb);
};

exports.infoImpl = function(routes, cb) {
  return routes.info(cb);
};

exports.createImpl = function(routes, attr, cb) {
  return routes.create(attr, cb);
};

exports.updateImpl = function(routes, attr, cb) {
  return routes.update(attr, cb);
};

exports.deleteImpl = function(routes, cb) {
  return routes.delete(cb);
};
