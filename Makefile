all: fvm fvm_install melos melos_bs flutterfire_cli
ci: dummy_env

fvm:
	dart pub global activate fvm

fvm_install:
	fvm install

melos:
	fvm flutter pub global activate melos

melos_bs:
	fvm flutter pub global run melos bootstrap

flutterfire_cli:
	fvm dart pub global activate flutterfire_cli

mason:
	fvm dart pub global activate mason_cli

mason_get:
	mason get

dummy_env:
	touch packages/flutter_app/env/.env.dev
	touch packages/flutter_app/env/.env.stg
	touch packages/flutter_app/env/.env.prod
	touch packages/graphql_playground/.env
	touch packages/restock_app/.env
