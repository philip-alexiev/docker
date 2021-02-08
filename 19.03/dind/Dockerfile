#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM palexiev/docker:19.03.15

RUN apt-get update

# https://github.com/docker/docker/blob/master/project/PACKAGERS.md#runtime-dependencies
RUN set -eux; \
	apt-get install -y \
		btrfs-progs \
		e2fsprogs \
		iptables \
		openssl \
		xfsprogs \
# pigz: https://github.com/moby/moby/pull/35697 (faster gzip implementation)
		pigz \
	;

# set up subuid/subgid so that "--userns-remap=default" works out-of-the-box
RUN set -eux; \
	addgroup --system dockremap; \
	adduser --system --ingroup dockremap dockremap; \
	echo 'dockremap:165536:65536' >> /etc/subuid; \
	echo 'dockremap:165536:65536' >> /etc/subgid

# https://github.com/docker/docker/tree/master/hack/dind
ENV DIND_COMMIT ed89041433a031cafc0a0f19cfe573c31688d377

RUN set -eux; \
	wget -O /usr/local/bin/dind "https://raw.githubusercontent.com/docker/docker/${DIND_COMMIT}/hack/dind"; \
	chmod +x /usr/local/bin/dind

COPY dockerd-entrypoint.sh /usr/local/bin/

VOLUME /var/lib/docker
EXPOSE 2375 2376

ENTRYPOINT ["dockerd-entrypoint.sh"]
CMD []
