# Base tutum/centos
FROM centos
MAINTAINER blackanger <blackanger.z@gmail.com>

# ruby env
# setup network
# reference from https://github.com/dotcloud/docker/issues/1240#issuecomment-21807183
RUN echo "NETWORKING=yes" > /etc/sysconfig/network

# setup remi repository
RUN wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN curl -O http://rpms.famillecollet.com/RPM-GPG-KEY-remi; rpm --import RPM-GPG-KEY-remi
RUN rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm

RUN yum -y update
RUN yum -y groupinstall --enablerepo=epel,remi "Development Tools"
RUN yum -y install --enablerepo=epel,remi openssl-devel git sqlite sqlite-devel libyaml-devel libxslt-devel

# setup rvm
RUN \curl -sSL https://get.rvm.io | bash -s stable --ruby
RUN rvm get head
RUN rvm install ruby-2.1.1
RUM rvm use 2.1.1 --default
RUN gem install bundle --no-ri --no-rdoc
RUN gem install goliath


# Configure my repo to use my custom Nginx with modsec
# ADD http://static.theroux.ca/repository/failshell.repo /etc/yum.repos.d/

# install deps
RUN yum -y install nginx

# tell Nginx to stay foregrounded
# RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# expose HTTP
EXPOSE 80

# Run
CMD /usr/sbin/nginx -c /etc/nginx/nginx.conf
