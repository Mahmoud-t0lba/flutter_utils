
rename_app: ^1.6.1

[x] if you Select the Same name for all apps

```sh
dart run rename_app:main all="My App Name"
```
====================================================================================================
[x] if you Select a Separated name for specified platform(s) and same for all others

```sh
dart run rename_app:main android="Android Name" ios="IOS Name" others="Others Name"
```

====================================================================================================
[x] if you Select a Separated name for each platform

```sh
dart run rename_app:main android="Android Name" ios="IOS Name" web="Web Name" mac="Mac Name" windows="Windows Name" linux="Linux Name"
```