-- | This API allows you to programmatically download the list of recipeints
-- | who have unsubscribed from your emails. You can also programmatically
-- | "clear" the unsubscribe event.
module Mailgun.Unsubscribes
       ( Unsubscribes
       , UnsubscribesAttr
       , unsubscribes
       , list
       , info
       , delete
       , create
       ) where

import Effect.Uncurried

import Data.Date (Date)
import Data.Function.Uncurried (Fn2, runFn2)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Mailgun (Mailgun)
import Mailgun.Common (Callback, JSCallback, handleCallback)
import Prelude (Unit)

foreign import data Unsubscribes :: Type

foreign import unsubscribesImpl :: Fn2 Mailgun (Nullable String) Unsubscribes
foreign import listImpl :: ∀ a.  EffectFn2 Unsubscribes (JSCallback a) Unit
foreign import infoImpl :: ∀ a. EffectFn2 Unsubscribes (JSCallback a) Unit
foreign import deleteImpl :: ∀ a. EffectFn2 Unsubscribes (JSCallback a) Unit
foreign import createImpl :: ∀ a. EffectFn3 Unsubscribes (UnsubscribesAttrExt) (JSCallback a) Unit

type UnsubscribesAttrExt =
  { address :: String
  , tag :: Nullable String
  , created_at :: Effect Date
  }

type UnsubscribesAttr =
  { address :: String
  , tag :: Maybe String
  , created_at :: Effect Date
  }

attrToExt :: UnsubscribesAttr -> UnsubscribesAttrExt
attrToExt u =
  { address: u.address
  , tag: (toNullable u.tag)
  , created_at : u.created_at
  }

-- | unsubscribes api
unsubscribes :: Mailgun -> Maybe String -> Unsubscribes
unsubscribes mlgn str = runFn2 unsubscribesImpl mlgn (toNullable str)

-- | Fetches the list of unsubscribes.
list :: ∀ a. Unsubscribes -> Callback a -> Effect Unit
list unsub cb = runEffectFn2 listImpl unsub (handleCallback cb)

-- | Retrieve a single unsubscribe record.
info :: ∀ a. Unsubscribes -> Callback a -> Effect Unit
info unsub cb = runEffectFn2 infoImpl unsub (handleCallback cb)

-- | Removes an addresss from the unsubscribes table.
delete :: ∀ a. Unsubscribes -> Callback a -> Effect Unit
delete unsubs cb = runEffectFn2 deleteImpl unsubs (handleCallback cb)

-- | Adds address to unsubscribed table.
create :: ∀ a. Unsubscribes -> UnsubscribesAttr -> Callback a -> Effect Unit
create unsubs attr cb =
  runEffectFn3 createImpl unsubs (attrToExt attr) (handleCallback cb)
