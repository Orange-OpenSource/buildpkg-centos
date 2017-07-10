FROM centos:6
MAINTAINER Michel Decima <michel.decima@orange.com>

RUN yum install -y \
        rpm-build rpmlint rpmdevtools yum-utils \
        git make automake gcc gcc-c++ kernel-devel \
        createrepo \
        fakeroot sudo \
        curl gnupg \
    && yum clean all

COPY yum-add-gitlab /usr/bin/
RUN yum-add-gitlab orange-opensource/gitlab-buildpkg-tools \
     && yum install -y gitlab-buildpkg-tools \
     && yum clean all 

