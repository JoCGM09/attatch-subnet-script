FROM ubuntu:latest
RUN apt-get update && apt-get install -y curl ca-certificates
RUN curl -fsSL https://clis.cloud.ibm.com/install/linux | sh
RUN ibmcloud plugin install power-iaas
COPY attach-subnet.sh /app/
WORKDIR /app
RUN chmod +x attach-subnet.sh 
CMD ["sh", "-c", "./attach-subnet.sh"]