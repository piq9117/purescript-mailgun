-- | Programatically get and modify domain credentials
module Mailgun.Credentials where

import Effect.Uncurried

import Data.Function.Uncurried (Fn2, runFn2)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Mailgun.Common (Callback, JSCallback, handleCallback)
import Mailgun.Domain (Domain)
import Prelude (Unit)

foreign import data Credentials :: Type
foreign import credentialsImpl :: Fn2 Domain (Nullable String) Credentials
foreign import listImpl :: ∀ a. EffectFn2 Credentials (JSCallback a) Unit
foreign import createImpl :: ∀ a. EffectFn3 Credentials Attr (JSCallback a) Unit
foreign import updateImpl :: ∀ a. EffectFn3 Credentials Attr (JSCallback a) Unit
foreign import deleteImpl :: ∀ a. EffectFn2 Credentials (JSCallback a) Unit

type Attr =
  { login :: String
  , password :: String
  }

credentials :: Domain -> Maybe String -> Credentials
credentials dom login = runFn2 credentialsImpl dom (toNullable login)

-- | Returns a list of SMTP credentials for the defined domain.
credentialList :: ∀ a. Credentials -> Callback a -> Effect Unit
credentialList cred cb = runEffectFn2 listImpl cred (handleCallback cb)

-- | Creates a new set of SMTP credentials for the defined domain
createCredentials :: ∀ a. Credentials -> Attr -> Callback a -> Effect Unit
createCredentials cred attr cb = runEffectFn3 createImpl cred attr (handleCallback cb)

-- | Updates the specified SMTP credentials. Currently only the password can be changed.
updateCredentials :: ∀ a. Credentials -> Attr -> Callback a -> Effect Unit
updateCredentials cred attr cb = runEffectFn3 updateImpl cred attr (handleCallback cb)

-- | Deletes the defined SMTP credentials.
deleteCredentials :: ∀ a. Credentials -> Callback a -> Effect Unit
deleteCredentials cred cb = runEffectFn2 deleteImpl cred (handleCallback cb)
