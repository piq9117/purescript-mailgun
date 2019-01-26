var isNil = function(a) {
  return a === undefined || a === null;
}

exports.credentialsImpl = function(domains, login) {
  if(isNil(creds)) {
    return domains.credentials();
  } else {
    return domains.credentials(login);
  }
};

exports.listImpl = function(credentials, cb) {
  return credentials.list(cb);
};

exports.createImpl = function(credentials, attributes, cb) {
  return credentials.create(attributes, cb);
};
