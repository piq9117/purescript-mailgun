var isNil = function (a) {
  return a === undefined || a === null;
};

exports.domain = function(mailgun, domainInput) {
  if(isNil(domainInput)) {
    return mailgun.domain();
  } else {
    return mailgun.domain(domainInput);
  };
};

exports.listImpl = function(mailgun, domain, domainInput, cb) {
  return domain(mailgun, domainInput).list(cb);
};
