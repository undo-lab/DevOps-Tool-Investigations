## Vault: [Docs](https://www.vaultproject.io/docs/internals/architecture/)
#### High-level
- Not so much a KMS, it just controls access to and storage of Secrets. Can be implemented with many different KMS.
- Dynamic infrastructure
- Central, unified access to secrets
- Dynamic Secrets, e.g. if a service needs access to storage, it asks vault for permission. Vault generates a temporary keypair that expires when no longer being used. 
- Secrets(all?) have an associated lease that wil expire, at which point a new secret must be generated
- Any amount of secrets can be revoked at any time
- All actions are logged per secret
- questions: how is the identity of a service/client validated? How to ensure the services requesting access are secure? What measures are taken to ensure the service itself isn't compromised?


#### Function
- Client interacts with vault via vault API, every request requires client to provide valid token
- Breakdown of whats inside the vault [diagram](vault.png)
- Upon every initialization, vault is 'sealed' with a newly generated encryption key, protected by the master key. 
- Uses Shamir's secret sharing algorithm to split master key into many parts, with a certain threshold number required to rebuild the master(can be disabled for directly unsealing with master)
- When a client connects, the auth method(can be configured) provides a set of policies that apply to that user. A token gets generated and sent back to the client which it then uses for future requests
- Every time the client makes a request, their token is checked for the applicable permissions.
- Every secret returned from the secret engine is given a temporary lease ID, which the client then uses to renew/revoke the secret. If the lease expires the secret is automatically revoked

#### Notes/comments
- Vault has excellent documentation with helpful diagrams, it should be the go-to for any questions. That being said, I put some helpful shortcuts below.
- It has a great built-in dev CLI, getting started is easy with this [tutorial](https://learn.hashicorp.com/vault?track=getting-started#getting-started). It was made to be easy to use with bash scripting.
- Vault also has an [HTTP api](https://www.vaultproject.io/api/index.html)(I imagine this would be the best way to interact with vault in a cluster), as well as a [rust crate](https://crates.io/crates/vault_client)
- Vault needs a storage backend, and does not explicitly protect it. Vault controls the readability of the data in storage, but the storage backend could theoretically be corrupted/destroyed without ever compromising any of the functionality of vault.
- Vault can use either static or dynamic secrets, dynamic secrets are simply generated upon request and can be revoked, so they cannot be stolen and are only given to authenticated users.

