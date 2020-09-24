# Identity Server running in Docker over HTTPS

This repository contains a fully working example setup of running the Identity Server protecting an example API with [Client Credentials Flow](https://auth0.com/docs/flows/client-credentials-flow).

We've got these entites involved:

- IdentityServer4 (aka [Identity Provider](https://en.wikipedia.org/wiki/Identity_provider))
- API
- Client (calls the API with Client Credentials Flow)

To spin up the IdentityServer4 and the API:

- generate self-signed developer certificates by running `generate_self_signed_cert.ps1` from Powershell as an Administrator (required only once)
- spin up IdentityServer4 and the API by runnig `docker-compose up`
- in a separate console invoke the Client:
    - `cd src/Client`
    - `dotnet run`

The Client application does the following:
- retrieves the discovery document from `https://localhost:5001` (IdentityService)
- retrieves the security token from `https://localhost:5001` (IdentityService)
- prints the content of the security token
- calls the API `https://localhost:6001` with the security token attached
- prints the API response