FROM centos:7
MAINTAINER Michel Decima <michel.decima@orange.com>

RUN yum install -y \
        rpm-build rpmlint rpmdevtools yum-utils \
        git make automake gcc gcc-c++ kernel-devel \
        createrepo \
        fakeroot sudo \
        curl gnupg \
    && yum clean all

COPY yum-add-gitlab /usr/bin/
RUN yum-add-gitlab Orange-OpenSource/gitlab-buildpkg-tools \
     && yum install -y gitlab-buildpkg-tools yum-add-gitlab \
     && yum clean all 

