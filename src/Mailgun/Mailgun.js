exports.mailgun = function(apiKey) {
  return function (domain) {
    return require("mailgun-js")({ apiKey: apiKey, domain: domain });
  };
};
