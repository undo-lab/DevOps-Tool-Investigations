## Keycloak: [Docs](https://www.keycloak.org/documentation.html)
#### High level
- Focuses on identity management and authentication; checks whether users have permission to access various resources using single sign-on
- A simple [diagram](keycloak.png)
- Separates all authentication from all core functionality, so main service doesn't see or even have access to user credentials/tokens
- Primarily(if not exclusively) for browser-based apps, 

#### Function
- App redirects user to Keycloak auth server
- Keycloak auth returns a cryptographically signed token to the app, which can contain identity and permissions data.
- Token is used for all invocations to a REST API
- questions: does this token expire/how is the user authenticated?

#### Notes/comments
- Has an up-to-date(March 2020) rust [crate](https://crates.io/crates/keycloak)
- Provides extensive configurability for the authentication itself
- Easy integration with vault