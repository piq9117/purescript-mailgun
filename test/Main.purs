module Test.Main where

import Node.Process

import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Console (log)
import Effect.Exception (message)
import Foreign.Object (lookup)
import Mailgun (Mailgun, MailgunMessage, MessageData(..), mailgun, sendMessage, messages)
import Prelude (Unit, ($), bind)

-- TODO: create FFI for node-env
mlgun :: Mailgun
mlgun = mailgun "API_KEY" "DOMAIN"

msgs :: MailgunMessage
msgs = messages mlgun

emailMessage :: MessageData
emailMessage = MessageData
    { from: "Excited User <me@samples.mailgun.org>"
    , to: "piq9117@gmail.com"
    , subject: "Hello"
    , text: "Testing some Mailgun awesomeness!"
    }

sndMessage :: Effect Unit
sndMessage =
  sendMessage msgs emailMessage handleCallback
  where
    handleCallback e =
      case e of
        Right r -> log r
        Left l -> log $ message l

main :: Effect Unit
main = do
  env <- getEnv
  case lookup "MAILGUN_SECRET" env of
    Nothing -> log "nothing"
    Just a -> log a
