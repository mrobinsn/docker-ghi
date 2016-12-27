build:
	sudo docker build -t="gpratt/ghi" .

run:
	sudo docker run --rm -t -i gpratt/ghi /bin/bash

clean:
	sudo docker rmi $(docker images gpratt/ghi --format "{{.ID}}")
