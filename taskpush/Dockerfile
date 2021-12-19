### First Stage ###
FROM  python:3.7-alpine as base

RUN apk add build-base &&  \
    pip install --no-cache-dir flask && \
    pip install pyinstaller && \
    pip3 install pytz


WORKDIR /app
COPY . /app

RUN pyinstaller /app/application.py -F  --name "Myapp" --clean

### Second Stage ###

FROM alpine
COPY --from=base /app/dist/ /
EXPOSE 5000 80 443
ENTRYPOINT ["./Myapp"]
