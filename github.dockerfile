FROM openjdk:11.0.8-slim

WORKDIR /app
COPY . /app/temp
RUN chmod +x ./temp/gradlew
RUN cd ./temp && ./gradlew installDist
RUN mv ./temp/build/install/registry-java-gradle/* .
RUN rm -rf ./temp
ENTRYPOINT ["./bin/registry-java-gradle"]

