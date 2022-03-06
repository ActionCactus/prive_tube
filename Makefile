setup-dev:
	python -m pip install -r requirements.txt

test:
	python -m pytest

static-analysis:
	./docker/run_static_analysis.sh

full-reset:
	rm -r data/*

init-db:
	touch data/app.db

migrate-up: init-db
	FLASK_APP=priv_tube.api DB_LOCATION=data/app.db python -m flask db upgrade --directory ./priv_tube/migrations

migrate-down:
	FLASK_APP=priv_tube.api DB_LOCATION=data/app.db python -m flask db downgrade --directory ./priv_tube/migrations
