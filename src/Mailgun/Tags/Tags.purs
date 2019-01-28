-- | Deletes all counters for particular tag and the tag itself.
module Tags
       ( Tags
       , Aggregates
       , Countries
       , Providers
       , Devices
       , TagStats
       , tags
       , info
       , aggregates
       , countries
       , countriesList
       , providers
       , providersList
       , devices
       , devicesList
       , delete
       , tagStats
       , tagStatsInfo
       ) where

import Mailgun.Common

import Data.Function.Uncurried (runFn1, Fn1, Fn2, runFn2)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Mailgun (Mailgun)
import Mailgun.Stats (Stats)
import Prelude (Unit)

foreign import data Tags :: Type
foreign import data Aggregates :: Type
foreign import data Countries :: Type
foreign import data Providers :: Type
foreign import data Devices :: Type
foreign import data TagStats :: Type

foreign import tagsImpl :: Fn2 Mailgun (Nullable String) Tags
foreign import infoImpl :: ∀ a. EffectFn2 Tags (JSCallback a) Unit
foreign import listImpl :: ∀ a. EffectFn2 Tags (JSCallback a) Unit
foreign import tagStatsImpl :: Fn1 Stats TagStats
foreign import tagStatsInfoImpl :: ∀ a. EffectFn2 TagStats (JSCallback a) Unit
foreign import aggregatesImpl :: Fn1 Stats Aggregates
foreign import countriesImpl :: Fn1 Aggregates Countries
foreign import countriesListImpl :: ∀ a. EffectFn2 Countries (JSCallback a) Unit
foreign import providersImpl :: Fn1 Aggregates Providers
foreign import providersListImpl :: ∀ a. EffectFn2 Providers (JSCallback a) Unit
foreign import devicesImpl :: Fn1 Aggregates Devices
foreign import devicesListImpl :: ∀ a. EffectFn2 Devices (JSCallback a) Unit
foreign import deleteImpl :: ∀ a. EffectFn2 Tags (JSCallback a) Unit

-- | tags api.
tags :: Mailgun -> Maybe String -> Tags
tags mg s = runFn2 tagsImpl mg (toNullable s)

-- | List all tags.
list :: ∀ a. Tags -> Callback a -> Effect Unit
list tag cb = runEffectFn2 listImpl tag (handleCallback cb)

-- | Gets a specific tag.
info :: ∀ a. Tags -> Callback a -> Effect Unit
info t cb = runEffectFn2 infoImpl t (handleCallback cb)

-- | tag stats api.
tagStats :: Stats -> TagStats
tagStats = runFn1 tagStatsImpl

-- | Returns statistics for a given tag.
tagStatsInfo :: ∀ a. TagStats -> Callback a -> Effect Unit
tagStatsInfo tag cb = runEffectFn2 tagStatsInfoImpl tag (handleCallback cb)

-- | aggregates api.
aggregates :: Stats -> Aggregates
aggregates s = runFn1 aggregatesImpl s

-- | countries api.
countries :: Aggregates -> Countries
countries a = runFn1 countriesImpl a

-- | Returns a list of countries of origin for a given doain for
-- | different event types.
countriesList :: ∀ a. Countries -> (Callback a) -> Effect Unit
countriesList c cb = runEffectFn2 countriesListImpl c (handleCallback cb)

-- | providers api.
providers :: Aggregates -> Providers
providers a = runFn1 providersImpl a

-- | Returns a list of email providers for a given domain for different
-- | event types.
providersList :: ∀ a. Providers -> Callback a -> Effect Unit
providersList p cb = runEffectFn2 providersListImpl p (handleCallback cb)

-- | devices api
devices :: Aggregates -> Devices
devices agg = runFn1 devicesImpl agg

-- | Returns a list of devices for a given domain that have triggered event types.
devicesList :: ∀ a. Devices -> Callback a -> Effect Unit
devicesList dev cb = runEffectFn2 devicesListImpl dev (handleCallback cb)

-- | Deletes all counters for particular tag and the tag itself.
delete :: ∀ a. Tags -> Callback a -> Effect Unit
delete tag cb = runEffectFn2 deleteImpl tag (handleCallback cb)
