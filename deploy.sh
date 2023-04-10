flutter build web
docker build -t grzybek/odyseja-pwa .
ssh grzybek docker kill $(ssh grzybek docker ps -q --filter ancestor=grzybek/odyseja-pwa )
docker save grzybek/odyseja-pwa | bzip2 | pv | ssh grzybek docker load
ssh grzybek docker run --net=host -d grzybek/odyseja-pwa