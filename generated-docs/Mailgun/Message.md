## Module Mailgun.Message

#### `MailgunMessage`

``` purescript
data MailgunMessage :: Type
```

#### `MessageData`

``` purescript
newtype MessageData
  = MessageData { from :: String, to :: String, subject :: String, text :: String }
```

#### `sendMessage`

``` purescript
sendMessage :: forall a. MailgunMessage -> MessageData -> Callback a -> Effect Unit
```

#### `messages`

``` purescript
messages :: Mailgun -> MailgunMessage
```


