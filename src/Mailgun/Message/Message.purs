module Mailgun.Message
       ( MailgunMessage
       , MessageData(..)
       , sendMessage
       , messages
       ) where

import Mailgun.Common

import Effect (Effect)
import Effect.Uncurried (EffectFn3, runEffectFn3)
import Mailgun (Mailgun)
import Prelude (Unit)

foreign import data MailgunMessage :: Type
foreign import sendMessageImpl
  :: ∀ a. EffectFn3 MailgunMessage MessageData (JSCallback a) Unit
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
  runEffectFn3 sendMessageImpl msg msgData (handleCallback cb)
