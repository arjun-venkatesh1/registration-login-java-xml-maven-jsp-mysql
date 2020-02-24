FROM ubuntu:latest
MAINTAINER Arjun Venkatesh <v.arjunyadav@gmail.com>

# Update and Install Java openjdk
RUN apt-get -y update && apt-get install -y curl wget openjdk-8-jdk

# Create directory for Tomcat
RUN mkdir /usr/local/tomcat

# Download tomcat
RUN wget http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.51/bin/apache-tomcat-8.5.51.tar.gz -O /tmp/tomcat.tar.gz

# Untar the downloaded Tomcat file
RUN cd /tmp && tar xvfz tomcat.tar.gz

# Copy the tomcat files to the directory created earlier
RUN cp -Rv /tmp/apache-tomcat-8.5.51/* /usr/local/tomcat/

# Expose port 8080 of the container
EXPOSE 8080

# Updating and Install Maven and git
RUN apt-get -y update && apt-get install -y maven git

# Cloning Java application from github
RUN git clone https://github.com/arjunyadav123/registration-login-java-xml-maven-jsp-mysql.git /tmp/project

# Working directory for packaging Java application
WORKDIR /tmp/project

# Building Java application using maven
RUN mvn package

# Copying war file to tomcat webapps directory
RUN cp /tmp/project/target/account-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/application.war

# Starting tomcat
CMD /usr/local/tomcat/bin/catalina.sh run
