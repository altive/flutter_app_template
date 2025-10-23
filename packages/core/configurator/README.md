# Configurator

Provides a wrapper class for the FlutterFire RemoteConfig package to simplify its usage.

It was created to make Firebase SDK versioning and methods easier to use.
It is recommended to use the various altfire packages as a set.

## Getting started

```yaml
dependencies:
  configurator: any
```

## Usage

1. Create an instance of `Configurator`.
2. Set default values as needed.
3. Use the instance of `Configurator` to retrieve configuration values. You can specify a callback in `onConfigUpdated` that is called when the configuration values are updated.

```dart
final configurator = Configurator();
...
await configurator.setDefaultConfig({'int_parameter', 123});
...
final intConfig = configurator.getIntConfig(
  'int_parameter',
  onConfigUpdated: (value) {
    print('int_parameter: $value');
  },
);
```