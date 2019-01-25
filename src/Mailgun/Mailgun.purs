module Mailgun
       ( Mailgun
       , MailgunMessage
       , Callback
       , JSCallback
       , handleCallback
       , mailgun
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

foreign import data Mailgun :: Type
foreign import data MailgunMessage :: Type
foreign import mailgun :: String -> String -> Mailgun
