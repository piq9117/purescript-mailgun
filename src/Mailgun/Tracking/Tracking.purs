-- | Programmatically get and modify domain tracking settings.
module Mailgun.Tracking
       ( Tracking
       , OpenTracking
       , ClickTracking
       , UnsubscribeTracking
       , IsActive(..)
       , tracking
       , trackingInfo
       , openTracking
       , clickTracking
       , updateOpenTracking
       , updateClickTracking
       , unsubscribeTracking
       , updateUnsubTracking
       ) where

import Data.Function.Uncurried (Fn1, runFn1)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Mailgun.Common (JSCallback, Callback, handleCallback)
import Mailgun.Domain (Domain)
import Prelude (Unit)

foreign import data Tracking :: Type
foreign import data OpenTracking :: Type
foreign import data ClickTracking :: Type
foreign import data UnsubscribeTracking :: Type

foreign import trackingImpl :: Fn1 Domain Tracking
foreign import infoImpl :: ∀ a. EffectFn2 Tracking (JSCallback a) Unit
foreign import openTrackingImpl :: Fn1 Tracking OpenTracking
foreign import updateOpenTrackingImpl
  :: ∀ a. EffectFn3 OpenTracking AttrExt (JSCallback a) Unit
foreign import clickTrackingImpl :: Fn1 Tracking ClickTracking
foreign import updateClickTrackingImpl
  :: ∀ a. EffectFn3 ClickTracking AttrExt (JSCallback a) Unit
foreign import unsubTrackingImpl :: Fn1 Tracking UnsubscribeTracking
foreign import updateUnsubTrackingImpl
  :: ∀ a. EffectFn3 UnsubscribeTracking UnsubscribeAttr (JSCallback a) Unit

data IsActive
  = Yes
  | No
  | HTML

type AttrExt =
  { active :: String }

type Attr =
  { active :: IsActive }

type UnsubscribeAttr =
  { active :: Boolean
  , html_footer :: String
  , text_footer :: String
  }

isActiveToStr :: IsActive -> String
isActiveToStr a =
  case a of
    Yes -> "yes"
    No -> "no"
    HTML -> "htmlonly"

attrToExt :: Attr -> AttrExt
attrToExt attr =
  { active : (isActiveToStr attr.active) }

-- | Tracking api
tracking :: Domain -> Tracking
tracking dom = runFn1 trackingImpl dom

-- | Returns tracking settings for a domain.
trackingInfo :: ∀ a. Tracking -> (Callback a) -> Effect Unit
trackingInfo trk cb = runEffectFn2 infoImpl trk (handleCallback cb)

-- | Open Tracking api.
openTracking :: Tracking -> OpenTracking
openTracking trk = runFn1 openTrackingImpl trk

-- | Click Tracking api
clickTracking :: Tracking -> ClickTracking
clickTracking trk = runFn1 clickTrackingImpl trk

-- | Updates the open tracking settings for a domain.
updateOpenTracking :: ∀ a. OpenTracking -> Attr -> Callback a -> Effect Unit
updateOpenTracking opt attr cb =
  runEffectFn3 updateOpenTrackingImpl opt (attrToExt attr) (handleCallback cb)

-- | Updates the click tracking settings for a domain.
updateClickTracking :: ∀ a. ClickTracking -> Attr -> Callback a -> Effect Unit
updateClickTracking ct attr cb =
  runEffectFn3 updateClickTrackingImpl ct (attrToExt attr) (handleCallback cb)

-- | Unsubscribe tracking api.
unsubscribeTracking :: Tracking -> UnsubscribeTracking
unsubscribeTracking trk = runFn1 unsubTrackingImpl trk

-- | Updates the unsubscribe tracking settings for domain.
updateUnsubTracking :: ∀ a. UnsubscribeTracking -> UnsubscribeAttr -> (Callback a) -> Effect Unit
updateUnsubTracking unsub attr cb =
  runEffectFn3 updateUnsubTrackingImpl unsub attr (handleCallback cb)
