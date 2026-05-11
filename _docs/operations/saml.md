---
layout: default
title: SAML Authentication
parent: Operations
---

# SAML Authentication
{: .no_toc}
Configure single sign-on (SSO) using SAML against your organization's identity provider.
{: .fs-6 .fw-300 }

1. TOC
{:toc}

## Overview

When SAML login is enabled, users are redirected to your identity provider (IdP) — such as Active Directory Federation Services or Entra ID. The IdP sends back a signed SAML response with the user's attributes and group memberships, which KDRS Search & View uses to assign a role.

## Configuration

Edit this file: `/var/kdrs/sv/.env`

`TIP` For security reasons, local login will be disabled when SAML_LOGIN=true
It's still possible to force LOCAL_LOGIN=true, but it is discouraged.

### Variables

| Variable | Description |
|---|---|
| `SAML_LOGIN` | Set to true |
| `IDP_SSO_SERVICE_URL` | The IdP's SSO endpoint |
| `IDP_CERT` | The IdP's public signing certificate in PEM format |
| `ASSERTION_CONSUMER_SERVICE_URL` | KDRS Search & View URL /saml/consume. Tell your IdP to redirect back to this address |
| `SP_ENTITY_ID` | KDRS Search & View URL |
| `ADMIN_GROUP` | regexp for admin group name - full access 
| `ARCHIVER_GROUP` | regexp for archiver group name - full access with some exceptions
| `CASEWORKER_GROUP` | regexp for caseworker group name - no access, unless specifically assigned in app

### Example

{% highlight bash %}
SAML_LOGIN=true
IDP_SSO_SERVICE_URL=https://idp.example.no/simplesaml/saml2/idp/SSOService.php
IDP_CERT=-----BEGIN CERTIFICATE-----
MIIDCzCCAfOgAwIBAgIJ...
-----END CERTIFICATE-----
ASSERTION_CONSUMER_SERVICE_URL=https://sv.example.no/saml/consume
SP_ENTITY_ID=https://sv.example.no
ADMIN_GROUP=innsyn-admin
ARCHIVER_GROUP=innsyn-arkivar
CASEWORKER_GROUP=innsyn-saksbehandler
{% endhighlight %}

You may have to specify port number, depending on the proxy config

### Proxy

If you use a proxy in front of the app (recommended), the address is https:// for encrypted communication.

If you don't have a proxy, use http://  \
This can work for internal systems, but external communication should be encrypted.

Often the proxy takes care of the port number (default: 3000) so it's not needed in the config. 

`TIP` You can also adjust the APP_PORT in .env if needed.

## Required IdP attributes

The IdP must release the following attributes:

| Attribute | Description |
|---|---|
| `mail` | Email address |
| `givenName` | First name |
| `sn` | Last name |
| `company` | Organization name |
| `mobile` | Phone number |
| `memberOf` | Group memberships — used for role assignment |

## Apply Configuration

Restart the application to apply the config

{% highlight bash %}
cd /var/kdrs/sv
sudo docker restart sv-app
{% endhighlight %}

Go to http://server:3000 and you should see your IdP login page


