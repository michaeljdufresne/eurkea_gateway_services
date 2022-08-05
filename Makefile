eureka_clean:
		./EurekaServer/mvnw clean

gateway_clean:
		./SpringApiGateway/mvnw clean

eureka_build: eureka_clean
		./EurekaServer/mvnw package

gateway_build: gateway_clean
		./SpringApiGateway/mvnw package