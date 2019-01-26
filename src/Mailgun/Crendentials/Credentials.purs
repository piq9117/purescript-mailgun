module Mailgun.Credentials where

import Effect.Uncurried

import Data.Function.Uncurried (Fn2, runFn2)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Mailgun.Common (JSCallback, Callback, handleCallback)
import Mailgun.Domain (Domain)
import Prelude (Unit)

foreign import data Credentials :: Type
foreign import credentialsImpl :: Fn2 Domain (Nullable String) Credentials
foreign import listImpl :: ∀ a. EffectFn2 Credentials (JSCallback a) Unit
foreign import createImpl :: ∀ a. EffectFn3 Credentials Attr (JSCallback a) Unit

type Attr =
  { login :: String
  , password :: String
  }

credentials :: Domain -> Maybe String -> Credentials
credentials dom login = runFn2 credentialsImpl dom (toNullable login)

credentialList :: ∀ a. Credentials -> Callback a -> Effect Unit
credentialList cred cb = runEffectFn2 listImpl cred (handleCallback cb)

createCredentials :: ∀ a. Credentials -> Attr -> Callback a -> Effect Unit
createCredentials cred attr cb = runEffectFn3 createImpl cred attr (handleCallback cb)
