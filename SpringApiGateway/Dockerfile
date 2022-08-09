FROM openjdk:17-oraclelinux8

# Install updates
RUN microdnf update -y

# Install some deps
RUN microdnf install unzip wget -y

# Install Maven
RUN wget https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz && \
    tar xzvf apache-maven-3.8.6-bin.tar.gz && \
    mv apache-maven-3.8.6 /opt/ && \
    rm -f apache-maven-3.8.6-bin.tar.gz

ENV PATH=/opt/apache-maven-3.8.6/bin:$PATH

# Utilize maven task to build the runnable jar
COPY . .

RUN mvn package -DskipTests -q && rm -rf root/.m2/repository
RUN cp target/api-gateway-0.0.1-SNAPSHOT.jar /app.jar

EXPOSE 8089
ENTRYPOINT ["java","-jar","/app.jar"]