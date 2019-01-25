module Mailgun.Message
       ( MailgunMessage
       , MessageData(..)
       , sendMessage
       , messages
       ) where

import Effect (Effect)
import Mailgun (Mailgun, Callback, JSCallback, handleCallback)
import Prelude (Unit)

foreign import sendMessageImpl
  :: ∀ a. MailgunMessage -> MessageData -> JSCallback a -> Effect Unit

foreign import data MailgunMessage :: Type

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
  sendMessageImpl msg msgData (handleCallback cb)
