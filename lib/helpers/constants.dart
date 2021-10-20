const auth0Domain = String.fromEnvironment('AUTH0_DOMAIN');
const auth0ClientId = String.fromEnvironment('AUTH0_CLIENT_ID');
const auth0Issuer = 'https://$auth0Domain';
const bundleIdentifier = 'com.cracker.red';
const auth0RedirectUri = '$bundleIdentifier://login-callback';