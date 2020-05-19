## Teleport: [Docs](https://gravitational.com/teleport/docs/architecture/teleport_architecture_overview/)
#### High-level
- Manages ssh connections to clusters of machines(includes kubernetes)
- Single ssh gateway for an entire organization/cluster
- uses auto-expiring keys signed by a cluster CA. Identity is verified using a third party login(e.g. github)
- Role-based access control
- Docs contain a series of helpful diagrams

#### Function
1. Client attempts to establish ssh connection(CLI or browser) to teleport proxy by offering their public key.
2. Proxy checks if submitted certificate is valid(not expired/signed). If not valid, sign in via 2FA. Auth server validates sign in, and returns auto-expiring certificate(12 Hour TTL).
3. Connect to desired Node(using DNS or other labeling convention)
4. Node receives connection request, and asks auth server to validate the certificate of incoming connection(in normal use cases, this would be the certificate of the Teleport Proxy)
5. Node requests list of OS users from auth server to ensure incoming user is allowed to login.

#### Notes/comments
- Documentation is pretty good, I got started with this [tutorial](https://gravitational.com/teleport/docs/quickstart/#step-1-install-teleport)
- This is just for handling ssh sessions to a distributed system, so the purpose of this all is really just to look into how it works(but it might be a useful security feature for a cluster)
- Does not have a known rust crate