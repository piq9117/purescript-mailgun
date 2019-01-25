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

exports.listImpl = function(domain, domainInput, cb) {
  return domain(domainInput).list(cb);
};
