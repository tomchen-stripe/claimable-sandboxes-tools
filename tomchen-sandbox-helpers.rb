##########################################################
## Renew SandboxClaimToken
##########################################################

sandbox_claim_token = Opus::Sandboxes::AnonymousSandboxes::Private::Model::SandboxClaimToken
  .query_by(:merchant)
  .load_one({merchant: 'acct_1SFKfSNDivafgd0p'})

renewed_sandbox_claim_token, claimable_sandbox_compartment_sharded = Opus::Sandboxes::AnonymousSandboxes::Command::RenewAndSendClaimEmail
  .call(
    claim_token: sandbox_claim_token
  )

########################################################
###### Send Claim Sandbox Email
########################################################

Opus::Sandboxes::AnonymousSandboxes::Command::Email::SendClaimSandboxEmail.call(
  claim_signature: 'YWNjdF8xU0ZLZlNORGl2YWZnZDBwLDE3NjAzODg5NzAv100CZtiHYgY',
  recipient_email: 'tomchen+qa@stripe.com'
)
