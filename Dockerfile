############################################################
# Dockerfile to build Quagga container images
# Based on CentOS 7
############################################################
FROM centos:latest
MAINTAINER "Kevin Kirsche" <kevin.kirsche@verizon.com>
ENV container docker

# Update and clean the repository sources list
RUN yum -y update && \
    yum clean all

################## BEGIN INSTALLATION ######################
# Install Quagga, Telnet, and TCPDump
RUN yum -y install quagga \
    telnet \
    tcpdump
##################### INSTALLATION END #####################

################## BEGIN CONFIGURATION ######################
# Use the sample configurations as our production configs
# COPY babeld.conf /etc/quagga/babeld.conf
COPY bgpd.conf /etc/quagga/bgpd.conf
# COPY isisd.conf /etc/quagga/isisd.conf
# RUN mv ospf6d.conf /etc/quagga/ospf6d.conf
# RUN mv ospfd.conf /etc/quagga/ospfd.conf
# RUN mv ripd.conf /etc/quagga/ripd.conf
# RUN mv ripngd.conf /etc/quagga/ripngd.conf
# RUN mv zebra.conf /etc/quagga/zebra.conf

EXPOSE 2605

CMD ["bgpd"]

