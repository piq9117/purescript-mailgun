## Module Mailgun

This package provides purescript bindings for the node library
[mailgun-js](http://bojand.github.io/mailgun-js/#/README)

#### `Mailgun`

``` purescript
data Mailgun :: Type
```

#### `MailgunCreds`

``` purescript
data MailgunCreds
  = MailgunCreds { apiKey :: String, domain :: String }
```

#### `mailgun`

``` purescript
mailgun :: MailgunCreds -> Mailgun
```

Provide mailgun with `MailgunCreds` so it will return `Mailgun` which is
required by other modules.


