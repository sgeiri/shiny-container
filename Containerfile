FROM docker.io/almalinux/10-base AS builder
RUN dnf install -y epel-release && \
    rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-10 && \
    dnf install -y --nodocs R-base R-devel cmake cairo-devel libXt-devel openssl-devel udunits2-devel \
                   libpq-devel fribidi-devel \
                   gdal-devel proj-devel geos-devel && \ 
    dnf clean all
RUN --mount=type=bind,source=.,target=/mnt/context \
     Rscript /mnt/context/packages.R

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
FROM docker.io/almalinux/10-base
RUN dnf install -y epel-release  && \
    rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-10 && \
    dnf install -y --nodocs --setopt=install_weak_deps=False \
                   R-base openssl java-21-openjdk-headless libpq vim && \
    dnf clean all
RUN dnf install -y https://download3.rstudio.org/centos8/x86_64/shiny-server-1.5.23.1030-x86_64.rpm
COPY --from=builder /usr/lib64/R/library/ /usr/lib64/R/library/
COPY --from=builder /usr/share/R/library/ /usr/share/R/library/
# WHAT TO DO TO GET SHINY SERVER TO START
CMD ["shiny-server"]
