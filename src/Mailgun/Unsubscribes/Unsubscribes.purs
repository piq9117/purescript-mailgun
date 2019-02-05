module Mailgun.Unsubscribes where

import Mailgun
import Data.Nullable (Nullable)

foreign import data Unsubscribes :: Type

foreign import unsubscribesImpl :: Mailgun -> Nullable String -> Mailgun
