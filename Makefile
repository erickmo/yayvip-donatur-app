APP_NAME=yayvip_donatur_app

.PHONY: get build run clean test analyze gen

## Setup
get:
	flutter pub get

## Run
run:
	flutter run

run-dev:
	flutter run --dart-define=BASE_URL=http://localhost:8080/api/v1

run-staging:
	flutter run --dart-define=BASE_URL=https://staging-api.yayvip.com/api/v1

run-prod:
	flutter run --dart-define=BASE_URL=https://api.yayvip.com/api/v1

run-web:
	flutter run -d chrome --dart-define=BASE_URL=http://localhost:8080/api/v1

## Build
build-apk:
	flutter build apk --release \
		--dart-define=BASE_URL=https://api.yayvip.com/api/v1

build-aab:
	flutter build appbundle --release \
		--dart-define=BASE_URL=https://api.yayvip.com/api/v1

build-ios:
	flutter build ios --release \
		--dart-define=BASE_URL=https://api.yayvip.com/api/v1

build-web:
	flutter build web --release \
		--dart-define=BASE_URL=https://api.yayvip.com/api/v1

## Testing
test:
	flutter test

test-coverage:
	flutter test --coverage
	genhtml coverage/lcov.info -o coverage/html
	@echo "Coverage: coverage/html/index.html"

## Code Quality
analyze:
	flutter analyze

lint:
	dart fix --dry-run

fix:
	dart fix --apply

## Code Generation
gen:
	flutter pub run build_runner build --delete-conflicting-outputs

gen-watch:
	flutter pub run build_runner watch --delete-conflicting-outputs

## Utilities
clean:
	flutter clean
	flutter pub get

upgrade:
	flutter pub upgrade
