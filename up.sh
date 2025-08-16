#!/bin/bash

code . &&
	docker run --rm -it --name nextjs -v $PWD:/app -w /app -u $(id -u):$(id -g) -p 3000:3000 node:24-bookworm yarn dev
