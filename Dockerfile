FROM centos:8
MAINTAINER Michel Decima <michel.decima@orange.com>

RUN yum install -y \
        rpm-build rpmlint rpmdevtools yum-utils \
        git make automake gcc gcc-c++ kernel-devel \
        createrepo \
        sudo \
        curl gnupg \
    && yum clean all

COPY yum-add-gitlab /usr/bin/
RUN yum-add-gitlab Orange-OpenSource/gitlab-buildpkg-tools \
     && yum install -y gitlab-buildpkg-tools \
     && yum clean all 

