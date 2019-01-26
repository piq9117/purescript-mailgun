-- | This package provides purescript bindings for the node library
-- | [mailgun-js](http://bojand.github.io/mailgun-js/#/README)
module Mailgun
       ( Mailgun(..)
       , MailgunCreds(..)
       , mailgun
       ) where

foreign import data Mailgun :: Type

data MailgunCreds =
  MailgunCreds
  { apiKey :: String
  , domain :: String
  }

foreign import mailgunImpl :: String -> String -> Mailgun

-- | Provide mailgun with `MailgunCreds` so it will return `Mailgun` which is
-- | required by other modules.
mailgun :: MailgunCreds -> Mailgun
mailgun (MailgunCreds { apiKey, domain }) = mailgunImpl apiKey domain
