module Mailgun.Message
       ( MailgunMessage
       , MessageData(..)
       , sendMessage
       , messages
       ) where

import Data.Function.Uncurried (Fn3, runFn3)
import Effect (Effect)
import Mailgun (Mailgun)
import Prelude (Unit)
import Mailgun.Common

foreign import data MailgunMessage :: Type
foreign import sendMessageImpl
  :: ∀ a. Fn3 MailgunMessage MessageData (JSCallback a) (Effect Unit)
foreign import messages :: Mailgun -> MailgunMessage

newtype MessageData =
  MessageData
  { from :: String
  , to :: String
  , subject :: String
  , text :: String
  }

sendMessage :: ∀ a. MailgunMessage -> MessageData -> Callback a -> Effect Unit
sendMessage msg msgData cb =
  runFn3 sendMessageImpl msg msgData (handleCallback cb)
