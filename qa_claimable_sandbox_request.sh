curl -X POST https://qa-api.stripe.com/v2/core/claimable_sandboxes   -H "Authorization: Bearer $STRIPE_ACCOUNT_SK_TEST_KEY"   -H "Stripe-Version: 2025-08-27.preview"   --json '{
>     "prefill": {
>         "email": "tomchen+qa@stripe.com",
>         "country": "us"
>     },
>     "enable_mcp_access": true
>   }'
