# Gutendex book Apps

A flutter project for Gutendex book apps.
Using :

-   Flutter 3.22.0 in FVM
-   DIO for rest API
-   BLoC for state management
-   Hive for cache management

How to run auto generator `dart run build_runner build --delete-conflicting-outputs`

## Directory Structure

```
.
├── core
└── features
```

-   `core` contains the application theme and shared widget.
-   `features` contains a folder for each feature such as `login` or `menu`.

## Setting up Environment Variables

Environment variables are loaded using [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
package.

Create a file named `env/.env` in your local repository. This file should not be commited and is
added into `.gitignore`.

To quickly setup your local environment, copy the `.env.example` file with this command:

```bash
cp ./env/.dotenv.example ./env/.dotenv
```

## Contributor Guideline

### Network

Network-related files are located in `application/network` directory, broken down `rest`. `rest` are files related to usage of RESTful APIs, respectively.

For this project we are leveraging `rest`.

#### Dio

The HTTP Client used is [Dio](https://pub.dev/packages/dio). It supports features like timeout, interceptors (or middlewares), and base url. These constants can be found in `RestConfig` class.

Learn more by looking at the file [here](application/lib/network/rest/provider/dio_provider.dart)

#### Contributing

To define a new service for a particular resource e.g. `base_url/auth` resource, create a directory under `application/network/rest/services` which corresponds to the resource. In this case call it `auth`.

Then define a `xxxServiceClient` which will interact with that resource endpoints and have it `extend` `RestServiceClient`. For example,

```
@lazySingleton
class AuthServiceClient extends RestServiceClient {
  const AuthServiceClient(super.httpClientProvider);

  // implement every endpoints here
}
```

For request and response objects, create a `models` directory under that service's directory i.e. `application/network/rest/services/auth/models`.

Lastly, add the constants for resource path under `endpoints.dart`.
