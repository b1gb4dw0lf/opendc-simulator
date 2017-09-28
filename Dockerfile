FROM gradle:alpine
MAINTAINER Fabian Mastenbroek <f.s.mastenbroek@student.tudelft.nl>

# Copy OpenDC simulator
COPY ./ /simulator

# Fix permissions
USER root
RUN chown -R gradle:gradle /simulator
USER gradle

# Set the working directory to the JPA integration
WORKDIR /simulator/opendc-integration-jpa

# Run the application
CMD ["/bin/sh", "-c", "gradle run -Ppersistence.url=$PERSISTENCE_URL -Ppersistence.user=$PERSISTENCE_USER -Ppersistence.password=$PERSISTENCE_PASSWORD"]