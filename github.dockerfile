FROM openjdk:11.0.8-slim

WORKDIR /app
COPY . /app/temp
RUN ls -alh && ls -alh ./temp
RUN chmod +x ./temp/gradlew
RUN ls -alh ./temp
RUN cd ./temp && ./gradlew installDist
RUN pwd && ls -alh ./temp/build && ls -alh ./temp/build/install
RUN mv ./temp/build/install/registry-java-gradle/* .
RUN ls -alh
RUN rm -rf ./temp
ENTRYPOINT ["./bin/registry-java-gradle"]

