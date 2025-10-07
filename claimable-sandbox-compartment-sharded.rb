########################################################
###### Query for ClaimableSandboxCompartmentSharded
########################################################

Opus::Initialize.init()

db_name='v2db_d_sandboxesdb_a6ce'
collection_name='claimable_sandboxes'

shard_db_names = Opus::DB::Backend::Mproxy.all_dbs(
    collection: collection_name,
    db: db_name
)

docs = shard_db_names.flat_map do |shard_db_name|
    # puts shard_db_name
    shard_collection = Chalk::ODM::Backend::ConnectionManager.db(shard_db_name)[collection_name]
    result = shard_collection.find({_id: 'clmsbx_test_61TP5qX3YUVcDqCj116TOiQw0kSQigRkfl3iBz0TwILI'}).to_a
    if !result.empty?
      puts shard_db_name
      puts result
      break
    end
  end

#####
##### Update ClaimableSandboxCompartmentSharded : expired
#####

  shard_db_name = 'v2db_d_sandboxesdb_a6cedb_9ff1'
  collection_name = 'claimable_sandboxes'
  shard_collection = Chalk::ODM::Backend::ConnectionManager.db(shard_db_name)[collection_name]

  shard_collection.update({_id:"clmsbx_test_61TP5qX3YUVcDqCj116TOiQw0kSQigRkfl3iBz0TwILI"}, {"$set": { "sandbox_maximum_ttl_unless_claimed": 0.0, "claim_token_expires_at": 0, "created": 1759465756113.0, "updated": 1759465756113.0 } })

#####
##### Update ClaimableSandboxCompartmentSharded : renewable
#####

shard_db_name = 'v2db_d_sandboxesdb_a6cedb_9ff1'
collection_name = 'claimable_sandboxes'
shard_collection = Chalk::ODM::Backend::ConnectionManager.db(shard_db_name)[collection_name]

shard_collection.update({_id:"clmsbx_test_61TP5qX3YUVcDqCj116TOiQw0kSQigRkfl3iBz0TwILI"}, {"$set": { "sandbox_maximum_ttl_unless_claimed": 9007199254740991.0, "claim_token_expires_at": 0, "created": 1759465756113.0, "updated": 1759465756113.0 } })