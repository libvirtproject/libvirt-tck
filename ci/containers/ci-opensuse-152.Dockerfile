# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool dockerfile opensuse-152 libvirt+minimal,libvirt-perl,libvirt-tck
#
# https://gitlab.com/libvirt/libvirt-ci/-/commit/6552fd8885423cfc383a58255eca542937f7d4ea

FROM registry.opensuse.org/opensuse/leap:15.2

RUN zypper update -y && \
    zypper install -y \
           ca-certificates \
           ccache \
           cpp \
           gcc \
           gettext-runtime \
           git \
           glib2-devel \
           glibc-devel \
           glibc-locale \
           libgnutls-devel \
           libnl3-devel \
           libtirpc-devel \
           libxml2 \
           libxml2-devel \
           libxslt \
           make \
           ninja \
           perl \
           perl-App-cpanminus \
           perl-Archive-Tar \
           perl-CPAN-Changes \
           perl-Digest \
           perl-Digest-MD5 \
           perl-File-Slurp \
           perl-IO-String \
           perl-Module-Build \
           perl-NetAddr-IP \
           perl-Sub-Uplevel \
           perl-Test-Exception \
           perl-Test-Pod \
           perl-Test-Pod-Coverage \
           perl-XML-Twig \
           perl-XML-Writer \
           perl-XML-XPath \
           pkgconfig \
           python3-base \
           python3-docutils \
           python3-pip \
           python3-setuptools \
           python3-wheel \
           rpcgen \
           rpm-build && \
    zypper clean --all && \
    rpm -qa | sort > /packages.txt && \
    mkdir -p /usr/libexec/ccache-wrappers && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc

RUN pip3 install \
         meson==0.56.0

RUN cpanm --notest \
          Config::Record \
          IO::Compress::Bzip2 \
          LWP::UserAgent \
          TAP::Formatter::HTML \
          TAP::Formatter::JUnit \
          TAP::Harness::Archive \
          accessors

ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
ENV NINJA "/usr/bin/ninja"
ENV PYTHON "/usr/bin/python3"
ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
