# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool dockerfile centos-7 libvirt+minimal,libvirt-perl,libvirt-tck
#
# https://gitlab.com/libvirt/libvirt-ci/-/commit/b098ec6631a85880f818f2dd25c437d509e53680
FROM registry.centos.org/centos:7

RUN yum update -y && \
    echo 'skip_missing_names_on_install=0' >> /etc/yum.conf && \
    yum install -y epel-release && \
    yum install -y \
        ca-certificates \
        ccache \
        gcc \
        gettext \
        git \
        glib2-devel \
        glibc-common \
        glibc-devel \
        gnutls-devel \
        libnl3-devel \
        libtirpc-devel \
        libxml2 \
        libxml2-devel \
        libxslt \
        make \
        ninja-build \
        perl \
        perl-App-cpanminus \
        perl-Archive-Tar \
        perl-CPAN-Changes \
        perl-Digest \
        perl-Digest-MD5 \
        perl-File-Slurp \
        perl-IO-Compress-Bzip2 \
        perl-IO-String \
        perl-Module-Build \
        perl-NetAddr-IP \
        perl-Sub-Uplevel \
        perl-Test-Exception \
        perl-Test-Pod \
        perl-Test-Pod-Coverage \
        perl-Time-HiRes \
        perl-XML-Twig \
        perl-XML-Writer \
        perl-XML-XPath \
        pkgconfig \
        python3 \
        python3-pip \
        python3-setuptools \
        python3-wheel \
        python36-docutils \
        rpm-build && \
    yum autoremove -y && \
    yum clean all -y && \
    rpm -qa | sort > /packages.txt && \
    mkdir -p /usr/libexec/ccache-wrappers && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/$(basename /usr/bin/gcc)

RUN pip3 install \
         meson==0.54.0

RUN cpanm --notest \
          Config::Record \
          LWP::UserAgent \
          TAP::Formatter::HTML \
          TAP::Formatter::JUnit \
          TAP::Harness::Archive \
          accessors

ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
ENV NINJA "/usr/bin/ninja-build"
ENV PYTHON "/usr/bin/python3"
ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
