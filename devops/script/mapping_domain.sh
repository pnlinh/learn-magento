#!/usr/bin/env bash
hotel rm -n waitrr && hotel add http://localhost:10001 -n waitrr
hotel rm -n adminer.waitrr && hotel add http://localhost:10002 -n adminer.waitrr
