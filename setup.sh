minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb ; kubectl apply -f ./srcs/metallb.yaml
minikube addons enable dashboard
echo "============== INFLUXDB =============="
docker build -t influxdb_xxx ./srcs/influxdb ; kubectl apply -f ./srcs/influxdb/influxdb.yaml
echo "============== FTPS =============="
docker build -t ftps_xxx ./srcs/ftps ; kubectl apply -f ./srcs/ftps/ftps.yaml
echo "============== MYSQL =============="
docker build -t mysql_xxx ./srcs/mysql ; kubectl apply -f ./srcs/mysql/mysql.yaml
echo "============== PHPMYADMIN =============="
docker build -t phpmyadmin_xxx ./srcs/phpmyadmin ; kubectl apply -f ./srcs/phpmyadmin/pma.yaml
echo "============== WORDPRESS =============="
docker build -t wordpress_xxx ./srcs/wordpress ; kubectl apply -f ./srcs/wordpress/wp.yaml
echo "============== NGINX =============="
docker build -t nginx_xxx ./srcs/nginx ; kubectl apply -f ./srcs/nginx/nginx.yaml
echo "============== GRAFANA =============="
docker build -t grafana_xxx ./srcs/grafana ; kubectl apply -f ./srcs/grafana/grafana.yaml
# eval $(minikube docker-env) ; docker pull metallb/speaker:v0.8.2 ; docker pull metallb/controller:v0.8.2