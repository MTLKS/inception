docker stop $(docker ps -qa)
docker rm $(docker ps -qa)
docker rmi -f $(docker images -qa)
docker volume rm $(docker volume ls -q)
docker network rm $(docker network ls -q) 2>/dev/null
sudo rm -rvf /home/maliew/data/db/* /home/maliew/data/files/* /home/maliew/data/prometheus/*
exit 0