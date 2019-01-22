module Mailgun
       ( MessageData(..)
       , Mailgun
       , MailgunMessage
       , sendMessage
       , mailgun
       , messages
       ) where

import Prelude

import Data.Either (Either(..))
import Data.Function.Uncurried (Fn2, Fn3, runFn3)
import Data.Nullable (Nullable)
import Effect (Effect)
import Effect.Exception (Error)

type JSCallback a = Fn2 (Nullable Error) a Unit
type Callback a = Either Error a -> Effect Unit

foreign import handleCallbackImpl
  :: ∀ a.
     Fn3 (Error -> Either Error a)
     (a -> Either Error a)
     (Callback a)
     (JSCallback a)

handleCallback :: ∀ a. (Callback a) -> JSCallback a
handleCallback cb = runFn3 handleCallbackImpl Left Right cb

newtype MessageData =
  MessageData
  { from :: String
  , to :: String
  , subject :: String
  , text :: String
  }

foreign import data Mailgun :: Type
foreign import data MailgunMessage :: Type
foreign import mailgun :: String -> String -> Mailgun
foreign import messages :: Mailgun -> MailgunMessage
foreign import sendMessageImpl
  :: ∀ a. MailgunMessage -> MessageData -> JSCallback a -> Effect Unit

sendMessage :: ∀ a. MailgunMessage -> MessageData -> Callback a -> Effect Unit
sendMessage msg msgData cb =
  sendMessageImpl msg msgData (handleCallback cb)

