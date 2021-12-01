# PDRIS
sbertech course

1)
запускать в папке task1:
sudo docker build -t mydocker .
sudo docker run -d -p 3000:3000
sudo docker image push mydocker

2) 
запускать в папке task2:
sudo docker-compose up
контейнеры могут общаться, достаточно зайти в, например, первый с помощью команды
 "sudo docker exec -it "ip_conteiner" bash"
и в контейнере прописать "curl http://app2:3001"
