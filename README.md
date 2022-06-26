# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 2.7.4
* No passwords

* POST JSON to `http://localhost:3000/api/v1/payments` and it will return pain xml
```azure
{
    "payment":{
        "type":"DirectDebitPayment",
        "creditor": {
            "name": "Kunze, Ankunding and Torphy",
            "iban": "GB56TVXL97349086722829",
            "bic": "ABBEGB21",
            "creditor_identifier": "DE98ZZZ09999999999"
        },
        "transactions":[
            {
                "name": "Kunze, Ankunding and Torphy",
                "iban": "GB56TVXL97349086722829",
                "bic": "ABBEGB21",
                "amount": 30.95,
                "mandate_date_of_signature": "20-03-2020",
                "mandate_id": "asdasdasada",
                "local_instrument": "CORE",
                "sequence_type": "OOFF"
            }
        ]

    }
}

```
