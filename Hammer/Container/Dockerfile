from centos:7

RUN yum -y install \
    https://yum.theforeman.org/releases/2.1/el7/x86_64/foreman-release.rpm \
    http://fedorapeople.org/groups/katello/releases/yum/3.16/katello/el7/x86_64/katello-repos-latest.rpm \
    http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    centos-release-scl.noarch
RUN yum -y install \
    tfm-rubygem-hammer_cli_katello.noarch \
    tfm-rubygem-hammer_cli_foreman_remote_execution.noarch \
    tfm-rubygem-hammer_cli_foreman \
    tfm-rubygem-hammer_cli \
    jq \
    && yum clean all

RUN mkdir -p /root/.hammer/cli.modules.d
COPY foreman.yml /root/.hammer/cli.modules.d/foreman.yml

USER root
WORKDIR /root

RUN hammer --fetch-ca-cert https://satellite.lab.example.com/ 
