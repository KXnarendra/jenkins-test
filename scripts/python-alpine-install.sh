
#!/bin/sh


apk update
apk add --no-cache --virtual .build-deps make automake gcc g++ subversion python3-dev
pip install --no-cache-dir pandas==1.2.3
apk del .build-deps

