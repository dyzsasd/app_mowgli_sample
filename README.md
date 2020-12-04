# mowgli

Mowgli App

## Resources / assets

All resources are stored in the `res` directory:

- `res/images`: images
- `res/i18n`: csv file used by flappy_translator

### Generate resources

Just run `spider build --watch --verbose`

### Translations

#### Google Sheet with translations

Download the file with:

```
curl -o res/i18n/translations.csv https://docs.google.com/spreadsheets/d/e/2PACX-1vTRBW2-6hVqk3ZCB6jjZFpSoty8stigBbCV6E9xNlrcNFfUXKAZ3CfNCaAr9BxSdiTn3oiGOD1Nntx6/pub\?gid\=0\&single\=true\&output\=csv
```

#### Generate Dart Code with

The first time you use the tool, don't forget to run a:

```
flutter pub get
```

Then you just need to call

```
flutter pub run flappy_translator
```