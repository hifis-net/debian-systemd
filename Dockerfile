ARG VERSION=12

FROM debian:${VERSION}-slim
LABEL maintainer="HIFIS (https://www.hifis.net)"

ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       sudo systemd systemd-sysv \
       build-essential wget libffi-dev libssl-dev procps \
       python3-dev \
       iproute2 \
    && rm -rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

# Make sure systemd doesn't start agettys on tty[1-6].
RUN rm -f /lib/systemd/system/multi-user.target.wants/getty.target

# Create ansible user with sudo permissions
ENV ANSIBLE_USER=ansible \
    SUDO_GROUP=sudo

# Create non-root user with sudo access
RUN set -xe \
    && groupadd -r ${ANSIBLE_USER} \
    && useradd -m -g ${ANSIBLE_USER} ${ANSIBLE_USER} \
    && usermod -aG ${SUDO_GROUP} ${ANSIBLE_USER} \
    && sed -i "/^%${SUDO_GROUP}/s/ALL\$/NOPASSWD:ALL/g" /etc/sudoers

CMD ["/lib/systemd/systemd"]
