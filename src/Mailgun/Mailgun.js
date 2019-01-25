exports.handleCallbackImpl = function (left, right, f) {
  return function (err, value) {
    if (err) {
      f(left(err))();
    } else {
      f(right(value))();
    }
  };
};

exports.mailgun = function(apiKey) {
  return function (domain) {
    return require("mailgun-js")({ apiKey: apiKey, domain: domain });
  };
};
