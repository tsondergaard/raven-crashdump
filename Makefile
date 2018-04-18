.PHONY: all rpm rpm-el6 rpm-el7

rpm:
	rpmbuild -bb \
         --define="_topdir $(CURDIR)/rpmbuild" \
         --define="raven_coredump_source_dir $(CURDIR)" \
         --define="raven_coredump_version $$($(CURDIR)/raven-coredump --version)" \
         raven-coredump.spec

rpm-el6:
	sudo docker run -ti --rm -v $(CURDIR):$(CURDIR) -w $(CURDIR) \
         -e DOCKER_UID=$$(id -u) -e DOCKER_GID=$$(id -g) -e DOCKER_USERNAME=$$(id -nu) \
         centos:6 $(CURDIR)/make-rpm-in-docker-helper.sh

rpm-el7:
	sudo docker run -ti --rm -v $(CURDIR):$(CURDIR) -w $(CURDIR) \
         -e DOCKER_UID=$$(id -u) -e DOCKER_GID=$$(id -g) -e DOCKER_USERNAME=$$(id -nu) \
         centos:7 $(CURDIR)/make-rpm-in-docker-helper.sh
