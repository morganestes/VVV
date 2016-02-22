#!/bin/sh
# Sets up Cleveland Clinic using VV

main() {
	yes | run_vv
}

run_vv() {
	vv create \
	--name "clevelandclinic" \
	--domain "wordpress.clevelandclinic.dev" \
	--live-url "wordpress.clevelandclinic.org" \
	--multisite subdomain \
	--git-repo "git@10up.git.beanstalkapp.com:/10up/cleveland-clinic-health.git" \
	--database $(pwd)/clevelandclinic.sql \
	--download-search-and-replace \
	--images \
	--debug \
	--remove-defaults \
	--defaults
}

main
