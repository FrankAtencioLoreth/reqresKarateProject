// karate-config.js
function fn() {
  var config = {
    baseUrl: 'https://reqres.in', // Your base URL
    baseUrlUsers: 'https://jsonplaceholder.typicode.com', // Another base URL for users
    apiKey: 'pro_7e8a9c4bc9937c72e320cbb90ca3a06131237a9cbb9c2533' // Your API key
  };

  // Optional: environment-specific configurations
  var env = karate.env; // 'karate.env' can be passed via command line (e.g., -Dkarate.env=qa)
  if (env === 'qa') {
    config.baseUrl = 'https://reqres.in';
    config.baseUrlUsers = 'https://jsonplaceholder.typicode.com';
  } else if (env === 'prod') {
    config.baseUrl = 'https://reqres.in';
    config.baseUrlUsers = 'https://jsonplaceholder.typicode.com';
  }

  // Example of setting a global header configuration
  karate.configure('headers', {
    'x-api-key': config.apiKey,
    'Accept': 'application/json'
  });

  return config;
}
