var isNil = function (a) {
  return a === undefined || a === null;
};

exports.domainImpl = function(mailgun, domainInput) {
  if(isNil(domainInput)) {
    return mailgun.domains();
  } else {
    return mailgun.domains(domainInput);
  };
};

exports.listImpl = function(domains, cb) {
  return domains.list(cb);
};

exports.infoImpl = function(domains, cb) {
  return domains.info(cb);
};

exports.createImpl = function(domains, attributes, cb) {
  return domains.create(attributes, cb);
};

exports.deleteImpl = function(domains, cb) {
  return domains.delete(cb);
}

exports.verifyImpl = function(domains, attributes, cb) {
  return domains.verify().verify(attributes, cb);
}
