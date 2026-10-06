VENV="./.venv/"

if [ ! -d "$VENV" ]; then
	python3 -m venv .venv
fi
