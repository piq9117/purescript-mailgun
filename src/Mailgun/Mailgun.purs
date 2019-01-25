module Mailgun
       ( Mailgun
       , mailgun
       ) where

foreign import data Mailgun :: Type
foreign import mailgun :: String -> String -> Mailgun
