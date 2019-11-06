FROM centos:8
LABEL maintainer="github.com/rhysmeister"
RUN yum update -y

COPY resources/mongodb.repo /etc/yum.repos.d/
COPY resources/mongod.conf /etc/mongod.conf
RUN yum clean all
RUN yum install mongodb-org -y

EXPOSE 27017/tcp

# Don't use su in the CMD but rather USER dockerfile instruction
USER mongod
CMD ["mongod", "-f", "/etc/mongod.conf"]
