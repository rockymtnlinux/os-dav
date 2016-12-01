
# os-dav
FROM openshift/base-centos7

# TODO: Put the maintainer name in the image metadata
MAINTAINER Mike Meador ( rockymtnlinux@gmail.com )

# TODO: Rename the builder environment variable to inform users about application you provide them
ENV OS_DAV 0.01 

# TODO: Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="WebDAV container for Openshift/kubernetes" \
      io.k8s.display-name="os-dav 0.01 " \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="os-dav,0.01"

# TODO: Install required packages here:
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && yum install -y nginx-1.10.2 nginx-all-modules-1.10.2 tar \
    && yum clean all -y

# TODO (optional): Copy the builder files into /opt/app-root
# COPY ./<builder_folder>/ /opt/app-root/

# TODO: Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image sets io.openshift.s2i.scripts-url label that way, or update that label
COPY ./.s2i/bin/ /usr/libexec/s2i

# TODO: Drop the root user and make the content of /opt/app-root owned by user 1001
RUN mkdir /data \
    && chown -R 1001:1001 /data /etc/nginx /var/lib/nginx /var/log/nginx

# This default user is created in the openshift/base-centos7 image
USER 1001

# TODO: Set the default port for applications built using this image
EXPOSE 8080

# TODO: Set the default CMD for the image
 CMD ["usage"]
