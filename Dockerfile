FROM gentoo/portage:latest AS portage
FROM gentoo/stage3-amd64:latest

COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo

RUN mkdir -p /var/db/repos/localrepo-crossdev/
COPY conf/ /
RUN chown -R portage:portage /var/db/repos/localrepo-crossdev

RUN emerge -qv crossdev
