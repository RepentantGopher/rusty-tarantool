build:
	docker build -t builder-image -f ./docker/Dockerfile .

create:
	docker rm -f builder || true
	docker create --name builder builder-image

copy:
	docker cp builder:/usr/src/rusty-tarantool/src/bindings.rs ./src/bindings.rs

test:
	cargo build
	cargo test

default: build create copy test
