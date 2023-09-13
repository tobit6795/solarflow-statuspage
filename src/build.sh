#tag=`git rev-parse --abbrev-ref HEAD`
tag=latest
USER=tobit6795
IMAGE=solarflow-statuspage

docker stop ${IMAGE} || echo cannot stop, ${IMAGE} does not exist
docker rm ${IMAGE} || echo Cannot delete, ${IMAGE} does not exist
docker build -t ${USER}/${IMAGE}:$tag .
docker image push ${USER}/${IMAGE}:$tag
docker run -d --restart=always -p 127.0.0.1:5000:5000 --env-file .env --name ${IMAGE} ${USER}/${IMAGE}
