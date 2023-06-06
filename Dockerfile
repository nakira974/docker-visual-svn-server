FROM ubuntu:latest

RUN apt-get update -y && \
    apt-get install -y subversion && \
    mkdir /var/svn && \
    svnadmin create /var/svn/central && \
    touch /var/log/svnserve.log && \
    chmod 666 /var/log/svnserve.log

EXPOSE 3690

CMD ["bash", "-c", "tail -f /var/log/svnserve.log & svnserve --foreground -d -r /var/svn --log-file=/var/log/svnserve.log"]