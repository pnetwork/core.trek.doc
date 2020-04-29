.PHONY: pre-build

pre-build:
	mkdir -p template && \
	ofsm template -l python3_blcks_flask template && \
	faas-cli build --name=detectredis --lang=python3_blcks_flask --image=detectredis --handler=handler --shrinkwrap && \
	cp *.para build/detectredis