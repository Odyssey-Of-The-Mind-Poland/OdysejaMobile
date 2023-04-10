docker build -t grzybek/lappka .
ssh grzybek docker kill $(ssh grzybek docker ps -q --filter ancestor=grzybek/lappka )
docker save grzybek/lappka | bzip2 | pv | ssh grzybek docker load
ssh grzybek docker run -p 9080:9080 --net=host -d grzybek/lappka