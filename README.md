# StripeAPI

StripeAPI is a Framework that can handle [Stripe](https://stripe.com/docs/api) type-safely.

## Installation

__[CocoaPods](https://github.com/cocoapods/cocoapods)__

- Inset `pod 'StripeAPI'` to your Podfile.
- Run `pod install`

###  ⚠️ Attention ⚠️
All model definitions and API definitions have not been completed.

## Usage
The Stripe API is faithfully made to the document.

### Set your API-key

https://dashboard.stripe.com/account/apikeys

⚠️ **Use restricted API Key. Do not use SecretKey.**

``` swift
let configure: Configuration = Configuration(apiK: "rk_test_xxxxxxxx")
```

### Call
``` swift
Customer.Create().send { (result) in
    case .success(let response): print(response)
    case .failure(let error): print(error)
}
``` 
