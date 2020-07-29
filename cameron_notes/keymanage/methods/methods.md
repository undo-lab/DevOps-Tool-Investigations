# Utilizing Key management techniques

## Vault secrets 
- To minimize damage done, all nodes could be authorized using temporary secrets, at which point the node needs to be re-authenticated, and given a new key
- source based revocation? although I dont imagine revocation is the issue, unless the admin server gets compromised
- Keys could be rotated on a schedule, and we could do a rekey on a schedule as well or randomly
### Situation Contribution: Does as is intended; it handles keys
Allows integration with keycloak, and can hold/handle all the keys. Doesn't interfere with teleport either

## Teleport
- not much to it, but adding teleport for ssh sessions to the cloudburst toolset could be an extra selling point, particularly if cluster can only be acessed through teleport
- Most helpful in situations where you dont access through a central config already, i.e. through aws/kubernetes. Allows secure access to clusters not made through these tools already. 
### Situation Contribution: Secures admin access
Client has a distributed system created manually(perhaps connected via consul). Access managed securely through teleport ensures security when not using a cloud cluster already

## Keycloak
- Could use it for key authentication/authorization, it has configurable auth methods authorization. Auth method could be changed periodically 
### Situation Contribution: Secures public facing services
All access to public services is handled by keycloak, and with admin access handled by teleport all bases are covered

## Situation Summary:
Keys handled and managed by Vault, all public facing services authorized with keycloak, all admin access handled by teleport(or cloud service like aws/digitalocean)

