#!/bin/sh

##
# A helper script for updates

VERSION=0.7
REVISION=3

rfc2822_date="$(date +"%a, %d %b %Y %T %z")"
series=precise

printf "Updating..."
echo "memcached-top (${VERSION}-${REVISION}+${series}1) $series; urgency=low

  * Upstream release ${VERSION}.

 -- Ross Duggan <ross.duggan@acm.org>  $rfc2822_date
" > changelog

git add *
git commit -am "Release upstream $VERSION, packaging revision $REVISION" && \
git tag -a $VERSION -m $VERSION
printf "Ready to push.\n"
