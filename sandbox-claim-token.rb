########################################################
###### Query for SandboxClaimToken
########################################################

Opus::Initialize.init()

db_name='split'
collection_name='sandbox_claim_tokens'

shard_db_names = Opus::DB::Backend::Mproxy.all_dbs(
    collection: collection_name,
    db: db_name
)

docs = shard_db_names.flat_map do |shard_db_name|
    # puts shard_db_name
    shard_collection = Chalk::ODM::Backend::ConnectionManager.db(shard_db_name)[collection_name]
    result = shard_collection.find({_id: 'sbxclm_1SFhtAP65L0LDGYAeRK7S2zo'}).to_a
    if !result.empty?
      puts shard_db_name
      puts result
      break
    end
  end

  #####
  ##### update SandboxClaimToken : expired
  #####

  shard_db_name = 'splitdb_489d'
  collection_name = 'sandbox_claim_tokens'
  shard_collection = Chalk::ODM::Backend::ConnectionManager.db(shard_db_name)[collection_name]

  new_signature = Opus::Sandboxes::AnonymousSandboxes::Private::Utils::ClaimTokenSignature.generate(
    merchant_token: 'acct_1SFht8P65L0LDGYA',
    expires_at: 0
  )

  shard_collection.update({_id:"sbxclm_1SFhtAP65L0LDGYAeRK7S2zo"}, {"$set": { "expires_at": 0, claim_signature: new_signature, "created": 1759465756113.0, "updated": 1759465756113.0 } })

  #####
  ##### update SandboxClaimToken : renewable
  #####

  shard_db_name = 'splitdb_489d'
  collection_name = 'sandbox_claim_tokens'
  shard_collection = Chalk::ODM::Backend::ConnectionManager.db(shard_db_name)[collection_name]

  new_signature = Opus::Sandboxes::AnonymousSandboxes::Private::Utils::ClaimTokenSignature.generate(
    merchant_token: 'acct_1SFhfVNUwr0qlRuN',
    expires_at: 1759817896336
  )

  shard_collection.update({_id:"sbxclm_1SFhtAP65L0LDGYAeRK7S2zo"}, {"$set": { "expires_at": 1759817896336, claim_signature: new_signature, "created": 1759465756113.0, "updated": 1759465756113.0 } })